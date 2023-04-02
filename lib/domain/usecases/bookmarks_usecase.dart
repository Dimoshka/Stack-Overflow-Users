import 'package:injectable/injectable.dart';

import '../repositories/repositories.dart';

abstract class BookmarksUseCase {
  Future<Set<int>> getUsersBookmarked();
  Future<void> addUserToBookmarks(int id);
  Future<void> removeUserFromBookmarks(int id);
}

@LazySingleton(as: BookmarksUseCase)
class BookmarksUseCaseImpl implements BookmarksUseCase {
  final PreferencesRepository _prefsRepo;

  const BookmarksUseCaseImpl(this._prefsRepo);

  @override
  Future<void> addUserToBookmarks(int id) =>
      _prefsRepo.addBookmark(id.toString());

  @override
  Future<void> removeUserFromBookmarks(int id) =>
      _prefsRepo.removeBookmark(id.toString());

  @override
  Future<Set<int>> getUsersBookmarked() => _prefsRepo
      .getBookmarks()
      .then((value) => value.map((e) => int.tryParse(e) ?? 0).toSet());
}
