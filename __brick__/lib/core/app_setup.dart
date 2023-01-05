import 'dart:async';
import 'package:api_com/api_com.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppSetup {
  Future<void> init() async {
    setupWeb();

    await _setupHive();

    await _setupApiCom();
  }

  Future<void> _setupHive() async {
    await Hive.initFlutter();
  }

  Future<void> _setupApiCom() async {
    final packageInfo = await _getPackageInfo();

    Com.config = ComConfig(
      preDecorder: (payload) => payload['payload'],
      sharedHeaders: {
        'User-Agent':
            'App: ${packageInfo.appName}, Version: ${packageInfo.version} (${packageInfo.buildNumber})',
      },
    );
  }

  Future<PackageInfo> _getPackageInfo() async {
    return PackageInfo.fromPlatform();
  }

  void setupWeb() {
    if (!kIsWeb) {
      return;
    }

    usePathUrlStrategy();
  }
}
