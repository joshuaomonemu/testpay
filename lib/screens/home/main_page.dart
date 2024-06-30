import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payment_app/constants/asset_path.dart';
import 'package:payment_app/constants/color_constants.dart';
import 'package:payment_app/core/api_calls/api_call.dart';
import 'package:payment_app/screens/airtime/airtime_screen.dart';
import 'package:payment_app/screens/bills/bills_screen.dart';
import 'package:payment_app/screens/home/home_screen.dart';
import 'package:payment_app/screens/repayments/repayments_screen.dart';

class MainPage extends ConsumerStatefulWidget {
  final int pageIndex;

  const MainPage({
    this.pageIndex = 0,
    Key? key,
  }) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  static const HomeScreen _homeScreen = HomeScreen();
  static const BillsScreen _billsScreen = BillsScreen();
  static const AirtimeScreen _airtimeScreen = AirtimeScreen();
  static const RepaymentsScreen _repaymentsScreen = RepaymentsScreen();

  List pages = [
    const HomeScreen(),
    const RepaymentsScreen(),
    const BillsScreen(),
    const AirtimeScreen(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    currentIndex = widget.pageIndex;

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        onTap(widget.pageIndex);
        if (AllApiCalls.isAPiCalled == 0) {
          AllApiCalls.makeAllApiCalls(ref, context);
        }
      },
    );    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Material(
        elevation: 8.0,
        child: BottomNavigationBar(
            // To fix the whiteness and invisibility, use type:BottomNavigationBarType.fixed
            type: BottomNavigationBarType.fixed,
            backgroundColor: whiteBackground,
            onTap: onTap,
            currentIndex:
                currentIndex, //currentIndex is used to identify the current page
            selectedItemColor: purpleButton,
            unselectedItemColor: const Color(0xFF1B1B1F),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(ImageAssetsPath.navHome),
                  color: currentIndex == 0 ? purpleButton : Colors.grey,
                ), // Change the icon based on currentIndex
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(ImageAssetsPath.navRapayments),
                  color: currentIndex == 1 ? purpleButton : Colors.grey,
                ), // Change the icon based on currentIndex
                label: 'Repayments',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(ImageAssetsPath.navBills),
                  color: currentIndex == 2 ? purpleButton : Colors.grey,
                ), // Change the icon based on currentIndex
                label: 'Bills',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(ImageAssetsPath.navAirtime),
                  color: currentIndex == 3 ? purpleButton : Colors.grey,
                ), // Change the icon based on currentIndex
                label: 'Airtime',
              )
            ]),
      ),
    );
  }
}
