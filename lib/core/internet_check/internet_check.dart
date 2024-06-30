import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:payment_app/constants/error_strings.dart';
import 'package:payment_app/constants/widgets/app_snackbar.dart';

class InternetCheck {
  static int movedToIntenetScreen = 0;
  static int showinternetToastFailure = 0;
  Timer? _countdownTimer;

  void startInternetRetry() {
    _countdownTimer = Timer.periodic(
        const Duration(seconds: 1), (_) => retryInternetCheckCall());
  }

  void stopTimer() {
    _countdownTimer?.cancel();
  }

  Future<void> retryInternetCheckCall() async {
    bool internetAccess = await isInternet();
    if (internetAccess) {
      stopTimer();
      movedToIntenetScreen = 0;
    }
  }

  // internet checker function
  /// If any of the pings returns true then you have internet (for sure). If none do, you probably don't.
  Future<bool> checkInternetAccess() {
    /// We use a mix of IPV4 and IPV6 here in case some networks only accept one of the types.
    /// Only tested with an IPV4 only network so far (I don't have access to an IPV6 network).
    final List<InternetAddress> dnss = [
      InternetAddress('8.8.8.8', type: InternetAddressType.IPv4), // Google
      InternetAddress('8.8.4.4', type: InternetAddressType.IPv4), // Google
      InternetAddress('2001:4860:4860::8888',
          type: InternetAddressType.IPv6), // Google
      InternetAddress('1.1.1.1', type: InternetAddressType.IPv4), // CloudFlare
      InternetAddress('1.0.0.1', type: InternetAddressType.IPv4), // CloudFlare
      InternetAddress('2606:4700:4700::1111',
          type: InternetAddressType.IPv6), // CloudFlare
      InternetAddress('208.67.222.222',
          type: InternetAddressType.IPv4), // OpenDNS
      InternetAddress('208.67.220.220',
          type: InternetAddressType.IPv4), // OpenDNS
      InternetAddress('2620:0:ccc::2',
          type: InternetAddressType.IPv6), // OpenDNS
      InternetAddress('180.76.76.76', type: InternetAddressType.IPv4), // Baidu
      InternetAddress('2400:da00::6666',
          type: InternetAddressType.IPv6), // Baidu
    ];

    final Completer<bool> completer = Completer<bool>();

    int callsReturned = 0;
    void onCallReturned(bool isAlive) {
      if (completer.isCompleted) return;

      if (isAlive) {
        completer.complete(true);
      } else {
        callsReturned++;
        if (callsReturned >= dnss.length) {
          completer.complete(false);
        }
      }
    }

    for (var dns in dnss) {
      _pingDns(dns).then(onCallReturned);
    }

    return completer.future;
  }

  Future<bool> _pingDns(InternetAddress dnsAddress) async {
    const int dnsPort =
        53; //A DNS server listens for requests on port 53 (both UDP and TCP). So all DNS requests are sent to port 53
    const Duration timeout = Duration(seconds: 2);

    Socket? socket;
    try {
      socket = await Socket.connect(dnsAddress, dnsPort, timeout: timeout);
      socket.destroy();
      return true;
    } on SocketException {
      if (socket != null) {
        socket!.destroy();
      }
      return false;
    }
    // return false;
  }

  // internet chcker 1 ends

  // internet checker 2
  Future<bool> isInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network, make sure there is actually a net connection.
      if (await checkInternetAccess()) {
        // Mobile data detected & internet connection confirmed.
        return true;
      } else {
        // Mobile data detected but no internet connection found.
        return false;
      }
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a WIFI network, make sure there is actually a net connection.
      if (await checkInternetAccess()) {
        // Wifi detected & internet connection confirmed.
        return true;
      } else {
        // Wifi detected but no internet connection found.
        return false;
      }
    } else {
      // Neither mobile data or WIFI detected, not internet connection found.
      return false;
    }
  }
  // internet checker 2 ends

  Future<bool> internetConnectionHandler(BuildContext context) async {
    bool internetAccess = await isInternet();

    if (!internetAccess) {
      if (movedToIntenetScreen == 0) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          AppSnackbar(context, isError: true)
              .showToast(text: ErrorStrings.NO_INTERNET_ERROR_TITLE);
        });

        // navigatorKey.currentState?.pushReplacement(
        //   MaterialPageRoute(builder: (context) {
        //     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        //       ShowToast.errorToast(context, "Please check your internet connection");
        //     });
        //     // return OnBoardingIntro();
        //   }));
        startInternetRetry();
        movedToIntenetScreen = 1;
      } else {
        movedToIntenetScreen = movedToIntenetScreen + 1;
      }
    } else {
      movedToIntenetScreen = 0;
    }

    return internetAccess;
  }
}
