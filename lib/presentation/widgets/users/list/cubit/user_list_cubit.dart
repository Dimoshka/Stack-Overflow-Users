import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../domain/models/models.dart';
import '../../../../../domain/usecases/usecases.dart';

part 'user_list_state.dart';

class UserListCubit extends Cubit<UserListState> {
  UserListCubit() : super(UserListInitial());

  void loadBookmarks() =>
      GetIt.I<BookmarksUseCase>().getUsersBookmarked().then((value) {
        emit(BookmarksLoaded(value));
      });

  void loadUsers(int page, int limit) {
    GetIt.I<StackOverflowUseCase>()
        .getUsers(page: page, pagesize: limit)
        .then((value) {
      emit(UsersLoaded(value));
    });
  }

  void changeBookmark(int userId, bool inBookmark) {
    if (inBookmark) {
      GetIt.I<BookmarksUseCase>()
          .removeUserFromBookmarks(userId)
          .then((_) => loadBookmarks());
    } else {
      GetIt.I<BookmarksUseCase>()
          .addUserToBookmarks(userId)
          .then((_) => loadBookmarks());
    }
  }
}
