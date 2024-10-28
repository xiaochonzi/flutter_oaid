
import 'flutter_oaid_platform_interface.dart';

class FlutterOaid {
  Future<String?> getPlatformVersion() {
    return FlutterOaidPlatform.instance.getPlatformVersion();
  }

  Future<Supplier> getOaid() async {
    return FlutterOaidPlatform.instance.getOaid();
  }
}
