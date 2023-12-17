import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'di.config.dart';

final sl = GetIt.instance;

@InjectableInit()
void configureDependencies() => sl.init();

@preResolve
Future<PackageInfo> get packageInfo => PackageInfo.fromPlatform();
