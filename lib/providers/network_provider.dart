import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payment_app/core/network/network_info.dart';
import 'package:payment_app/core/network/network_retry.dart';

import '../core/network/network_request.dart';

final networkInfoProvider = Provider<NetworkInfo>((ref) => NetworkInfoImpl());
final networkRequestProvider =
    Provider<NetworkRequest>((ref) => NetworkRequestImpl());
// provider to create the instant and for dependency injection
final networkRetryProvider =
    Provider<NetworkRetry>((ref) => NetworkRetryImpl());
