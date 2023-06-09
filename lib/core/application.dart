import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:loading_animations/loading_animations.dart';

import '../domain/usecases/usecases.dart';
import '../presentation/widgets/users/list/cubit/user_list_cubit.dart';
import '../presentation/widgets/users/reputations/cubit/user_reputation_cubit.dart';
import 'app_route.dart';
import 'cubit/application_cubit.dart';
import 'resources/themes/dark_theme.dart';
import 'resources/themes/light_theme.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.I.get<ApplicationCubit>(),
        ),
        BlocProvider(
          create: (context) => UserListCubit(),
        ),
        BlocProvider(
          create: (context) => UserReputationCubit(),
        ),
        RepositoryProvider(
          create: (context) => GetIt.I<AppRoute>(),
        ),
      ],
      child: BlocBuilder<ApplicationCubit, ApplicationState>(
        buildWhen: (previous, current) => current is ThemeChanged,
        builder: (context, state) {
          return MultiRepositoryProvider(
            providers: [
              RepositoryProvider.value(
                value: state.theme,
              ),
              RepositoryProvider.value(
                value: state.themeMode,
              ),
            ],
            child: MaterialApp.router(
              routeInformationProvider:
                  context.read<AppRoute>().route.routeInformationProvider,
              routeInformationParser:
                  context.read<AppRoute>().route.routeInformationParser,
              routerDelegate: context.read<AppRoute>().route.routerDelegate,
              onGenerateTitle: (context) =>
                  AppLocalizations.of(context)!.appName,
              theme: const LightAppThemeImpl().themeData,
              darkTheme: const DarkAppThemeImpl().themeData,
              themeMode: state.themeMode,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              debugShowCheckedModeBanner: false,
              builder: (context, child) {
                return BlocBuilder<ApplicationCubit, ApplicationState>(
                  buildWhen: (previous, current) =>
                      current is IsLoadingChanged &&
                          previous.isLoading != current.isLoading ||
                      current is ExceptionOccurred,
                  builder: (context, state) {
                    return Stack(
                      children: [
                        if (child != null) child,
                        Visibility(
                            visible: state.exception != null,
                            child: Center(
                              child: Card(
                                color: Theme.of(context)
                                    .colorScheme
                                    .errorContainer,
                                child: Container(
                                  padding: const EdgeInsets.all(16.0),
                                  constraints:
                                      const BoxConstraints(maxWidth: 320.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(AppLocalizations.of(context)!
                                              .oops),
                                          IconButton(
                                              onPressed: () =>
                                                  GetIt.I<ApplicationCubit>()
                                                      .exception(),
                                              icon: const Icon(Icons.close)),
                                        ],
                                      ),
                                      Center(
                                        child: Text(
                                          state.exception.toString(),
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .error),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                        Visibility(
                            visible: state.isLoading,
                            child: Center(
                              child: LoadingBouncingGrid.square(
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary,
                                inverted: true,
                              ),
                            )),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

@module
abstract class ApplicationModule {
  @lazySingleton
  ApplicationCubit appCubit() => ApplicationCubit(GetIt.I.get<AppUseCase>());
  @singleton
  AppRoute appRoute() => AppRoute();
}
