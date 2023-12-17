import 'dart:async';
import 'package:api_com/api_com.dart';
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permon/core/di.dart';

class AppSetup {
  AppSetup._();

  static final AppSetup instance = AppSetup._();

  Future<void> init() async {
    _setupDependencies();
    _setupWeb();
    // {{#useHive}}
    await _setupHive();
    // {{/useHive}}
    await _setupApiCom();
  }

  void _setupDependencies() {
    configureDependencies();
  }

// {{#useHive}}
  Future<void> _setupHive() async {
    await Hive.initFlutter();
  }
// {{/useHive}}

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

  void _setupWeb() {
    if (!kIsWeb) {
      return;
    }

    usePathUrlStrategy();
  }
}
