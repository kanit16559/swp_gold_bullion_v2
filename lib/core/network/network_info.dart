import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  static Future<bool> hasConnection() async {
    final List<ConnectivityResult> results = await Connectivity().checkConnectivity();
    return results.isNotEmpty && !results.contains(ConnectivityResult.none);
  }
}