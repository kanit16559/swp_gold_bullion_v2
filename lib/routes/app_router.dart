import 'package:flutter/material.dart';
import 'package:swp_gold_bullion_v2/routes/route_paths.dart';
import 'package:swp_gold_bullion_v2/view/home/home_page.dart';
import 'package:swp_gold_bullion_v2/view/intro/intro_page.dart';
import 'package:swp_gold_bullion_v2/view/splash/splash_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    debugPrint('🧭 Navigating to: ${settings.name}  arguments: ${settings.arguments}');

    switch (settings.name) {
      case RoutePaths.splash:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RoutePaths.splash
          ),
          builder: (_) => const SplashPage()
        );
      case RoutePaths.intro:
        return MaterialPageRoute(
          settings: RouteSettings(
            name: RoutePaths.intro
          ),
          builder: (_) => const IntroPage()
        );
      case RoutePaths.home:
        return PageRouteBuilder(
          settings: RouteSettings(
            name: RoutePaths.home
          ),
          pageBuilder: (_, __, ___) => const HomePage(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('404 Page Not Found')),
          ),
        );
    }
  }
}