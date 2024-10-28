import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'dart:convert';
import 'flutter_oaid_method_channel.dart';

class Supplier {
  bool? isSupported;
  String? oaid;
  String? vaid;
  String? aaid;

  Supplier({
    this.isSupported,
    this.oaid,
    this.vaid,
    this.aaid,
  });

  factory Supplier.fromRawJson(String str) => Supplier.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Supplier.fromJson(Map<String, dynamic> json) => Supplier(
    isSupported: json["isSupported"],
    oaid: json["oaid"],
    vaid: json["vaid"],
    aaid: json["aaid"],
  );

  Map<String, dynamic> toJson() => {
    "isSupported": isSupported,
    "oaid": oaid,
    "vaid": vaid,
    "aaid": aaid,
  };
}

abstract class FlutterOaidPlatform extends PlatformInterface {
  /// Constructs a FlutterOaidPlatform.
  FlutterOaidPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterOaidPlatform _instance = MethodChannelFlutterOaid();

  /// The default instance of [FlutterOaidPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterOaid].
  static FlutterOaidPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterOaidPlatform] when
  /// they register themselves.
  static set instance(FlutterOaidPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<Supplier> getOaid() {
    throw UnimplementedError('getOaid() has not been implemented.');
  }
}
