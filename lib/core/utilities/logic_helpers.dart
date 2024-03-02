import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easacc_task/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:permission_handler/permission_handler.dart';

mixin LogicHelpers {

  Future<void> requestOption(String type) async {
    if (type == LocaleKeys.settings_bluetooth.tr()){
     await _requestBluetooth();
    } else {
     await _requestWifi();
    }
  }

  static Future<void> _requestBluetooth() async {
    await Permission.bluetooth.request();
  }

  static Future<void> _requestWifi() async {
    await Connectivity().checkConnectivity();
  }
}
