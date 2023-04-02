import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../domain/models/models.dart';
import '../../../../../domain/usecases/usecases.dart';

part 'user_reputation_state.dart';

class UserReputationCubit extends Cubit<UserReputationState> {
  UserReputationCubit() : super(UserReputationInitial());

  void loadReputations(int userId, int page, int limit) {
    GetIt.I<StackOverflowUseCase>()
        .getReputationHistory(userId: userId, page: page, pagesize: limit)
        .then((value) {
      emit(ReputationsLoaded(value));
    });
  }
}
