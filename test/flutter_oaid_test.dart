import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_oaid/flutter_oaid.dart';
import 'package:flutter_oaid/flutter_oaid_platform_interface.dart';
import 'package:flutter_oaid/flutter_oaid_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterOaidPlatform
    with MockPlatformInterfaceMixin
    implements FlutterOaidPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<Supplier> getOaid() {
    // TODO: implement getOaid
    throw UnimplementedError();
  }
}

void main() {
  final FlutterOaidPlatform initialPlatform = FlutterOaidPlatform.instance;

  test('$MethodChannelFlutterOaid is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterOaid>());
  });

  test('getPlatformVersion', () async {
    FlutterOaid flutterOaidPlugin = FlutterOaid();
    MockFlutterOaidPlatform fakePlatform = MockFlutterOaidPlatform();
    FlutterOaidPlatform.instance = fakePlatform;

    expect(await flutterOaidPlugin.getPlatformVersion(), '42');
  });
}
