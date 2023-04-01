import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../presentation/screens/dashboard/dashboard_screen.dart';
import '../presentation/screens/splash/splash_screen.dart';

class AppRoute {
  static String splashRouteName = 'splash';
  static String dashBoardRouteName = 'dashboard';
  static String settingsBoardRouteName = 'settings';

  late final GoRouter _router;

  GoRouter get route => _router;

  AppRoute() {
    _router = GoRouter(
      routes: <GoRoute>[
        GoRoute(
            name: splashRouteName,
            path: '/',
            pageBuilder: (context, state) =>
                _getTransition(state: state, child: const SplashScreen()),
            routes: [
              GoRoute(
                name: dashBoardRouteName,
                path: 'dashboard',
                pageBuilder: (context, state) => _getTransition(
                    state: state,
                    child: DashBoardScreen(
                      key: ValueKey(DashboardNavigation.users.name),
                      navigation: DashboardNavigation.users,
                    )),
              ),
              GoRoute(
                name: settingsBoardRouteName,
                path: 'settings',
                pageBuilder: (context, state) => _getTransition(
                    state: state,
                    child: DashBoardScreen(
                      key: ValueKey(DashboardNavigation.settings.name),
                      navigation: DashboardNavigation.settings,
                    )),
              ),
            ]),
      ],
      redirect: (BuildContext context, GoRouterState state) {
        return null;
      },
      errorBuilder: (context, state) {
        return const Center(child: Text('ERROR - Page not found'));
      },
    );
  }

  Page<void> _getTransition({
    required GoRouterState state,
    required Widget child,
  }) =>
      (defaultTargetPlatform == TargetPlatform.android ||
              defaultTargetPlatform == TargetPlatform.iOS)
          ? MaterialPage(
              key: state.pageKey,
              child: child,
            )
          : NoTransitionPage(key: state.pageKey, child: child);
}
