abstract class AppUrls {
  //! baseUrl
  static const String _baseUrl = 'https://payscore.nw.r.appspot.com';
  static const String _authBaseUrl = '$_baseUrl/auth';

  //! auth
  static const String signup = '$_authBaseUrl/signup';
  static const String login = '$_authBaseUrl/login';
  static const String verifyEmail = '$_authBaseUrl/verify-email';
}
