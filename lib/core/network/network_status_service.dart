import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

/// ตรวจสอบสถานะการเชื่อมต่ออินเทอร์เน็ตแบบเรียลไทม์
class NetworkStatusService {
  final Connectivity _connectivity = Connectivity();
  final StreamController<bool> _controller = StreamController<bool>.broadcast();

  /// ใช้สำหรับ subscribe การเปลี่ยนแปลงของเน็ต
  Stream<bool> get onNetworkStatusChange => _controller.stream;

  NetworkStatusService() {
    _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> results) {
      // ✅ ตั้งแต่ v7.0.0 → onConnectivityChanged ส่ง "List<ConnectivityResult>"
      final hasConnection = _checkConnection(results);
      _controller.add(hasConnection);
    });
  }

  bool _checkConnection(List<ConnectivityResult> results) {
    // ถ้ามีสัญญาณอย่างน้อยหนึ่งประเภท แปลว่ามีการเชื่อมต่อ
    return results.isNotEmpty && !results.contains(ConnectivityResult.none);
  }

  void dispose() {
    _controller.close();
  }
}