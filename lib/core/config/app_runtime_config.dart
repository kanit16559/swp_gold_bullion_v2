

import 'package:flutter/cupertino.dart';

class AppRuntimeConfig with ChangeNotifier {
  // ------------------- Singleton -------------------
  static final AppRuntimeConfig _instance = AppRuntimeConfig._internal();
  factory AppRuntimeConfig() => _instance;
  AppRuntimeConfig._internal();


  // ------------------- Runtime Values -------------------
  String _language = 'en';
  bool _isDarkMode = false;
  String? _userToken;

  // ------------------- Getters -------------------
  String get language => _language;
  bool get isDarkMode => _isDarkMode;
  String? get userToken => _userToken;
  bool get isLoggedIn => _userToken != null && _userToken!.isNotEmpty;

  // ------------------- Initialization -------------------
  Future<void> init() async {

  }

  // ------------------- Setters -------------------
  Future<void> setLanguage(String lang) async {}

  Future<void> toggleDarkMode() async {
    notifyListeners();
  }

  Future<void> setToken(String? token) async {
    notifyListeners();
  }

  Future<void> logout() async {
    notifyListeners();
  }
}