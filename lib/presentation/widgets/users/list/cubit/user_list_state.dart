part of 'user_list_cubit.dart';

abstract class UserListState extends Equatable {
  const UserListState();

  @override
  List<Object> get props => [];
}

class UserListInitial extends UserListState {}

class UsersLoaded extends UserListState {
  final PaginationModel<UserModel> users;

  const UsersLoaded(this.users);

  @override
  List<Object> get props => [users];

  @override
  bool operator ==(Object other) => false;

  @override
  int get hashCode => users.hashCode;
}
