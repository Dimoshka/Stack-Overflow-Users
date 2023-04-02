abstract class PreferencesRepository {
  Future<bool> isFirstRun();
  Future<void> saveNoFirstRun();

  Future<int> getThemeMode();
  Future<void> saveThemeMode(int index);

  Future<Set<String>> getBookmarks();
  Future<void> addBookmark(String id);
  Future<void> removeBookmark(String id);
}
