import 'package:chopper/chopper.dart';
import 'package:chopper_built_value/chopper_built_value.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/models/models.dart';
import '../../../domain/repositories/repositories.dart';
import '../../entities/entities.dart';
import 'chopper_repository.dart';

@LazySingleton(as: ApiRepository)
class RestApiRepository implements ApiRepository {
  late final StackOverflowService _api;

  RestApiRepository() {
    final converter = BuiltValueConverter(serializers);
    final client =
        ChopperClient(converter: converter, errorConverter: converter);
    _api = StackOverflowService.create(client);
  }

  @override
  Future<PaginationModel<UserModel>> getUsers(
          {required int page, required int pagesize, required String site}) =>
      _api.getUsers(page: page, pagesize: pagesize, site: site).then((value) =>
          PaginationModel(
              items: value.body?.items.map((p0) => p0.toModel()).toList() ??
                  List<UserModel>.empty(),
              isMore: value.body?.isMore ?? false,
              max: value.body?.max ?? 0,
              remaining: value.body?.remaining ?? 0));

  @override
  Future<PaginationModel<UserReputationModel>> getReputationHistory(
          {required int userId,
          required int page,
          required int pagesize,
          required String site}) =>
      _api
          .getReputationHistory(
              userId: userId, page: page, pagesize: pagesize, site: site)
          .then((value) => PaginationModel(
              items: value.body?.items.map((p0) => p0.toModel()).toList() ??
                  List<UserReputationModel>.empty(),
              isMore: value.body?.isMore ?? false,
              max: value.body?.max ?? 0,
              remaining: value.body?.remaining ?? 0));
}
