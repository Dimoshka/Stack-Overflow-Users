import 'package:chopper/chopper.dart';

import '../../entities/entities.dart';

part 'chopper_repository.chopper.dart';

@ChopperApi(baseUrl: 'https://api.stackexchange.com/2.2/')
abstract class StackOverflowService extends ChopperService {
  static StackOverflowService create([ChopperClient? client]) =>
      _$StackOverflowService(client);

  @Get(path: 'users')
  Future<Response<PaginationUsersEntity>> getUsers({
    @Query() required int page,
    @Query() required int pagesize,
    @Query() required String site,
  });

  @Get(path: 'users/{userId}/reputation-history')
  Future<Response<PaginationUserReputationsEntity>> getReputationHistory({
    @Path() required int userId,
    @Query() required int page,
    @Query() required int pagesize,
    @Query() required String site,
  });
}
