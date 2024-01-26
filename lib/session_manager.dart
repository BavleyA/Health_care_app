class SessionManager {
  static String? _username;

  static String? get username => _username;

  static void setUser(String username) {
    _username = username;
  }
}

