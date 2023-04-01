import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_route.dart';
import '../../widgets/users/list/user_list_widget.dart';
import '../../widgets/users/reputations/user_reputation_widget.dart';
import '../settings/settings_screen.dart';

class DashBoardScreen extends StatefulWidget {
  final DashboardNavigation navigation;
  final int? selectedUserId;

  const DashBoardScreen(
      {super.key, required this.navigation, required this.selectedUserId});

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
  void didUpdateWidget(covariant DashBoardScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedUserId != widget.selectedUserId ||
        oldWidget.navigation != widget.navigation) {
      setState(() {
        _navigatedTab = widget.navigation;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      smallBreakpoint: const WidthPlatformBreakpoint(end: 800),
      mediumBreakpoint: const WidthPlatformBreakpoint(begin: 800, end: 1200),
      largeBreakpoint: const WidthPlatformBreakpoint(begin: 1200),
      selectedIndex: _navigatedTab == DashboardNavigation.users ||
              _navigatedTab == DashboardNavigation.reputations
          ? 0
          : 1,
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
      body: (_) => _navigatedTab == DashboardNavigation.users
          ? UserListWidget(
              selectedUserId: widget.selectedUserId,
            )
          : _navigatedTab == DashboardNavigation.reputations
              ? UserReputationsWidget(userId: widget.selectedUserId)
              : const SettingsSreen(),
      secondaryBody: _navigatedTab != DashboardNavigation.settings
          ? (_) => UserReputationsWidget(userId: widget.selectedUserId)
          : null,
      smallSecondaryBody: AdaptiveScaffold.emptyBuilder,
    );
  }
}

enum DashboardNavigation { users, reputations, settings }
