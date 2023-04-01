part of 'user_reputation_cubit.dart';

abstract class UserReputationState extends Equatable {
  const UserReputationState();

  @override
  List<Object> get props => [];
}

class UserReputationInitial extends UserReputationState {}

class ReputationsLoaded extends UserReputationState {
  final PaginationModel<UserReputationModel> reputations;

  const ReputationsLoaded(this.reputations);

  @override
  List<Object> get props => [reputations];

  @override
  bool operator ==(Object other) => false;

  @override
  int get hashCode => reputations.hashCode;
}
