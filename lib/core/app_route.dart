import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';

import '../presentation/screens/dashboard/dashboard_screen.dart';
import '../presentation/screens/settings/settings_screen.dart';
import '../presentation/screens/splash/splash_screen.dart';
import '../presentation/widgets/users/list/user_list_widget.dart';
import '../presentation/widgets/users/reputations/user_reputation_widget.dart';

class AppRoute {
  static String splashRouteName = 'splash';
  static String usersRouteName = 'users';
  static String reputationsRouteName = 'reputations';
  static String settingsBoardRouteName = 'settings';

  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

  late final GoRouter _router;

  GoRouter get route => _router;

  AppRoute() {
    _router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      routes: [
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state, child) {
              return _getTransition(
                  state: state,
                  child: DashBoardScreen(
                    body: SlotLayout(
                      config: <Breakpoint, SlotLayoutConfig>{
                        Breakpoints.small: SlotLayout.from(
                            key: const Key('small'), builder: (_) => child),
                        Breakpoints.mediumAndUp: SlotLayout.from(
                            key: const Key('medium'),
                            builder: (_) => state.params
                                        .containsKey('userId') &&
                                    state.location ==
                                        route.namedLocation(
                                            reputationsRouteName,
                                            params: {
                                              'userId':
                                                  state.params['userId'] ?? ''
                                            })
                                ? UserListWidget(
                                    selectedUserId: int.tryParse(
                                        state.params['userId'] ?? ''))
                                : child),
                      },
                    ),
                    secondaryBody: state.params.containsKey('userId') &&
                            state.location ==
                                route.namedLocation(reputationsRouteName,
                                    params: {
                                      'userId': state.params['userId'] ?? ''
                                    })
                        ? child
                        : state.location == route.namedLocation(usersRouteName)
                            ? const SizedBox.shrink()
                            : null,
                  ));
            },
            routes: [
              GoRoute(
                parentNavigatorKey: _shellNavigatorKey,
                name: usersRouteName,
                path: '/users',
                pageBuilder: (context, state) =>
                    _getTransition(state: state, child: const UserListWidget()),
              ),
              GoRoute(
                parentNavigatorKey: _shellNavigatorKey,
                name: reputationsRouteName,
                path: '/users/:userId/reputations',
                pageBuilder: (context, state) => _getTransition(
                    state: state,
                    child: UserReputationsWidget(
                        userId: state.params.containsKey('userId')
                            ? int.tryParse(state.params['userId'] ?? '')
                            : null)),
              ),
              GoRoute(
                parentNavigatorKey: _shellNavigatorKey,
                name: settingsBoardRouteName,
                path: '/settings',
                pageBuilder: (context, state) =>
                    _getTransition(state: state, child: const SettingsSreen()),
              ),
            ]),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          name: splashRouteName,
          path: '/',
          pageBuilder: (context, state) =>
              _getTransition(state: state, child: const SplashScreen()),
        ),
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
