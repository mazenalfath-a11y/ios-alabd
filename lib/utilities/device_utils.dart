import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DeviceUtils {
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  static final FlutterSecureStorage _storage = const FlutterSecureStorage();
  static const String _deviceIdKey = 'unique_device_id';

  /// Get a unique device ID based on platform
  static Future<String?> getDeviceId() async {
    try {
      String? deviceId;

      if (Platform.isAndroid) {
        // For Android, use androidId
        final AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
        deviceId = androidInfo.id;
      } else if (Platform.isIOS) {
        // For iOS, use identifierForVendor
        final IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor;
      } else {
        // For Web/Desktop, generate and store a unique ID
        deviceId = await _storage.read(key: _deviceIdKey);
        if (deviceId == null) {
          // Generate a new unique ID
          deviceId = DateTime.now().millisecondsSinceEpoch.toString() +
              '_' +
              (await _deviceInfo.deviceInfo).data['model'].toString();
          await _storage.write(key: _deviceIdKey, value: deviceId);
        }
      }

      return deviceId;
    } catch (e) {
      print('Error getting device ID: $e');
      return null;
    }
  }
}
