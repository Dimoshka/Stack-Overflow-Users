// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stack_overflow_users/core/app_route.dart' as _i5;
import 'package:stack_overflow_users/core/application.dart' as _i11;
import 'package:stack_overflow_users/core/cubit/application_cubit.dart' as _i6;
import 'package:stack_overflow_users/data/repositories/api/rest_api_repository.dart'
    as _i4;
import 'package:stack_overflow_users/data/repositories/preferences/shared_preferences_repository.dart'
    as _i7;
import 'package:stack_overflow_users/domain/repositories/repositories.dart'
    as _i3;
import 'package:stack_overflow_users/domain/usecases/app_usecase.dart' as _i9;
import 'package:stack_overflow_users/domain/usecases/bookmarks_usecase.dart'
    as _i10;
import 'package:stack_overflow_users/domain/usecases/stack_overflow_usecase.dart'
    as _i8;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final applicationModule = _$ApplicationModule();
    gh.lazySingleton<_i3.ApiRepository>(() => _i4.RestApiRepository());
    gh.singleton<_i5.AppRoute>(applicationModule.appRoute());
    gh.lazySingleton<_i6.ApplicationCubit>(() => applicationModule.appCubit());
    gh.lazySingleton<_i3.PreferencesRepository>(
        () => _i7.SharedPreferencesRepositoryImpl());
    gh.lazySingleton<_i8.StackOverflowUseCase>(
        () => _i8.StackOverflowUseCaseImpl(
              gh<_i3.ApiRepository>(),
              gh<_i6.ApplicationCubit>(),
            ));
    gh.lazySingleton<_i9.AppUseCase>(
        () => _i9.AppUseCaseImpl(gh<_i3.PreferencesRepository>()));
    gh.lazySingleton<_i10.BookmarksUseCase>(
        () => _i10.BookmarksUseCaseImpl(gh<_i3.PreferencesRepository>()));
    return this;
  }
}

class _$ApplicationModule extends _i11.ApplicationModule {}
