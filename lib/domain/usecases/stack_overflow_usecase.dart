import 'package:injectable/injectable.dart';

import '../../core/cubit/application_cubit.dart';
import '../models/models.dart';
import '../repositories/repositories.dart';

abstract class StackOverflowUseCase {
  Future<PaginationModel<UserModel>> getUsers(
      {required int page, required int pagesize});

  Future<PaginationModel<UserReputationModel>> getReputationHistory(
      {required int userId, required int page, required int pagesize});
}

@LazySingleton(as: StackOverflowUseCase)
class StackOverflowUseCaseImpl implements StackOverflowUseCase {
  final ApiRepository _api;
  final ApplicationCubit _app;

  const StackOverflowUseCaseImpl(this._api, this._app);

  @override
  Future<PaginationModel<UserModel>> getUsers(
          {required int page, required int pagesize}) =>
      Future.delayed(
        Duration.zero,
        () => _app.loadingShow(),
      )
          .then((_) => _api.getUsers(
              page: page, pagesize: pagesize, site: 'stackoverflow'))
          .catchError((onError) {
        _app.exception(onError);
        return PaginationModel<UserModel>.empty();
      }).whenComplete(() => _app.loadingHide());

  @override
  Future<PaginationModel<UserReputationModel>> getReputationHistory(
          {required int userId, required int page, required int pagesize}) =>
      Future.delayed(
        Duration.zero,
        () => _app.loadingShow(),
      )
          .then((_) => _api.getReputationHistory(
              userId: userId,
              page: page,
              pagesize: pagesize,
              site: 'stackoverflow'))
          .catchError((onError) {
        _app.exception(onError);
        return PaginationModel<UserReputationModel>.empty();
      }).whenComplete(() => _app.loadingHide());
}
