import 'package:demo/pages/dmp.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routers extends StatelessWidget {
  Routers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }

  // 路由
  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const Dmp();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'edit',
            builder: (BuildContext context, GoRouterState state) {
              return const Dmp();
            },
          ),
        ],
      ),
    ],
  );
}
