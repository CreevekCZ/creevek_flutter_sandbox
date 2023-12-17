import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'core/app.dart';
import 'core/app_setup.dart';
import 'env.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppSetup.instance.init();

  if (kDebugMode) {
    runApp(
      const ProviderScope(
        child: App(),
      ),
    );
  } else {
    await SentryFlutter.init(
      (options) {
        options
          ..dsn = '{{{sentryDns}}}'
          ..environment = Env.environment
          ..tracesSampleRate = 1.0;
      },
      appRunner: () => runApp(
        const ProviderScope(
          child: App(),
        ),
      ),
    );
  }
}
