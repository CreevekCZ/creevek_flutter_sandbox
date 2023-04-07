import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'const.dart';
import 'routing/router_provider.dart';
import 'providers/scaffold_messager_key_provider.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(routerProvider);

    return MaterialApp.router(
      title: '{{appName}}',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: ref.read(scaffoldMessengerKeyProvider),
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF00D1D2, color),
        primaryColor: Const.primary,
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Map<int, Color> get color => {
        50: Colors.grey.shade900,
        100: Colors.grey.shade900,
        200: Colors.grey.shade900,
        300: Colors.grey.shade900,
        400: Colors.grey.shade900,
        500: Colors.grey.shade900,
        600: Colors.grey.shade900,
        700: Colors.grey.shade900,
        800: Colors.grey.shade900,
        900: Colors.grey.shade900,
      };
}
