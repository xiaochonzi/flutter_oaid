import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_oaid_platform_interface.dart';

/// An implementation of [FlutterOaidPlatform] that uses method channels.
class MethodChannelFlutterOaid extends FlutterOaidPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_oaid');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<Supplier> getOaid() async {
    final Map<String, dynamic>? result = await methodChannel.invokeMapMethod<String, dynamic>('getOaid');
    return Supplier.fromJson(result!);
  }
}
