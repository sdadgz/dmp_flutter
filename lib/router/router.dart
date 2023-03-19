import 'dart:io';

import 'package:demo/components/common/udp.dart';
import 'package:demo/pages/dmp.dart';
import 'package:demo/pages/home.dart';
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
          return const Home();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'dmp',
            builder: (BuildContext context, GoRouterState state) {
              return Dmp(
                address: InternetAddress(
                    state.queryParams["address"] ?? "255.255.255.255"),
                port: int.parse(
                    state.queryParams["port"] ?? Udp.receiverPort.toString()),
              );
            },
          ),
        ],
      ),
    ],
  );
}
