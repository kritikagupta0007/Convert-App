part of profilepage;

class SessionStorage {
  static storage.Storage sessionStorage = storage.window.sessionStorage;

  static void saveValue(String key, String value) {
    sessionStorage[key] = value;
  }

  static String? getValue(String key) {
    return sessionStorage[key];
  }
}
