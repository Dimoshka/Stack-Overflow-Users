import '../models/models.dart';

abstract class ApiRepository {
  Future<PaginationModel<UserModel>> getUsers(
      {required int page, required int pagesize, required String site});

  Future<PaginationModel<UserReputationModel>> getReputationHistory(
      {required int userId,
      required int page,
      required int pagesize,
      required String site});
}
