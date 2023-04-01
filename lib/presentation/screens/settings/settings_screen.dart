import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/cubit/application_cubit.dart';

class SettingsSreen extends StatelessWidget {
  const SettingsSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocBuilder<ApplicationCubit, ApplicationState>(
        buildWhen: (_, current) => current is ThemeChanged,
        builder: (context, state) {
          return ListView(
            children: [
              SwitchListTile(
                title: Text(AppLocalizations.of(context)!.darkMode),
                subtitle: Text(AppLocalizations.of(context)!.theme),
                value: state.themeMode == ThemeMode.dark,
                onChanged: (_) =>
                    context.read<ApplicationCubit>().switchTheme(),
              ),
            ],
          );
        },
      ),
    );
  }
}
