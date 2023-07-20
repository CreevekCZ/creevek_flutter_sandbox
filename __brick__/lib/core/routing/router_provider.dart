import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palestine_console/palestine_console.dart';

final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    initialLocation: '/',
    observers: [],
    redirect: (context, state) {
      Print.green('ROUTER REDIRECT: ${state.location}', name: 'APP');
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (BuildContext context, GoRouterState state) =>
            const MaterialPage(child: Screen()),
      ),
      GoRoute(
        path: '/page-with-parameter/:id',
        pageBuilder: (BuildContext context, GoRouterState state) {
          final id = int.parse(state.pathParameters['id']!);
          return MaterialPage(child: Screen(id: id));
        },
      ),
    ],
  ),
);

class Screen extends StatelessWidget {
  const Screen({this.id, super.key});

  final int? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen ${id ?? ''}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                id != null ? 'id: $id' : 'no id',
              ),
            ],
          ),
          if (GoRouterState.of(context).location == '/')
            ElevatedButton(
              onPressed: () {
                context.push('/page-with-parameter/1');
              },
              child: const Text('Go to /page-with-parameter/1'),
            ),
        ],
      ),
    );
  }
}
