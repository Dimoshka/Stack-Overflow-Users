import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_route.dart';
import '../../widgets/users/list/user_list_widget.dart';
import '../settings/settings_screen.dart';

class DashBoardScreen extends StatefulWidget {
  final Widget body;
  final Widget? secondaryBody;

  const DashBoardScreen({super.key, required this.body, this.secondaryBody});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _menuSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _menuSelectedIndex = widget.body is SettingsSreen ? 1 : 0;
  }

  @override
  void didUpdateWidget(covariant DashBoardScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if ((oldWidget.body is UserListWidget && widget.body is! UserListWidget) ||
        (oldWidget.secondaryBody == null && widget.secondaryBody != null)) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      smallBreakpoint: const WidthPlatformBreakpoint(end: 800),
      mediumBreakpoint: const WidthPlatformBreakpoint(begin: 800, end: 1200),
      largeBreakpoint: const WidthPlatformBreakpoint(begin: 1200),
      selectedIndex: _menuSelectedIndex,
      internalAnimations: false,
      onSelectedIndexChange: (int index) => setState(() {
        _menuSelectedIndex = index;
        context.goNamed(index == 1
            ? AppRoute.settingsBoardRouteName
            : AppRoute.usersRouteName);
      }),
      useDrawer: false,
      destinations: [
        NavigationDestination(
          icon: const Icon(Icons.inbox_outlined),
          selectedIcon: const Icon(Icons.inbox),
          label: AppLocalizations.of(context)!.users,
        ),
        NavigationDestination(
          icon: const Icon(Icons.settings_outlined),
          selectedIcon: const Icon(Icons.settings),
          label: AppLocalizations.of(context)!.settings,
        ),
      ],
      body: (_) => widget.body,
      secondaryBody:
          widget.secondaryBody != null ? (_) => widget.secondaryBody! : null,
      smallSecondaryBody: AdaptiveScaffold.emptyBuilder,
    );
  }
}
