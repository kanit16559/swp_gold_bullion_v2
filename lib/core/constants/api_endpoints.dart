class ApiEndpoints {
  ApiEndpoints._(); // ป้องกันการสร้าง instance

  static const String login = "/auth/login";
  static const String register = "/auth/register";
  static const String profile = "/user/profile";
  static const String products = "/products";
  static const String refreshToken = "/auth/refresh-token";
}