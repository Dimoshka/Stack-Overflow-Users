import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:stack_overflow_users/core/app_route.dart';
import 'package:stack_overflow_users/presentation/widgets/users/reputation/user_reputation_widget.dart';

import '../../widgets/users/list/user_list_widget.dart';

class DashBoardScreen extends StatefulWidget {
  final DashboardNavigation navigation;

  const DashBoardScreen({super.key, required this.navigation});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  DashboardNavigation _navigatedTab = DashboardNavigation.users;

  @override
  void initState() {
    super.initState();
    _navigatedTab = widget.navigation;
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      selectedIndex: DashboardNavigation.values.indexOf(_navigatedTab),
      onSelectedIndexChange: (int index) {
        setState(() {
          _navigatedTab = DashboardNavigation.values[index];
          context
              .pushReplacementNamed(_navigatedTab == DashboardNavigation.users
                  ? AppRoute.dashBoardRouteName
                  : _navigatedTab == DashboardNavigation.settings
                      ? AppRoute.settingsBoardRouteName
                      : AppRoute.splashRouteName);
        });
      },
      useDrawer: false,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.inbox_outlined),
          selectedIcon: Icon(Icons.inbox),
          label: 'Users',
        ),
        NavigationDestination(
          icon: Icon(Icons.settings_outlined),
          selectedIcon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      body: (_) => const UserListWidget(),
      secondaryBody: _navigatedTab == DashboardNavigation.users
          ? (_) => const UserReputationWidget()
          : null,
      smallSecondaryBody: AdaptiveScaffold.emptyBuilder,
    );
  }
}

enum DashboardNavigation { users, settings }
