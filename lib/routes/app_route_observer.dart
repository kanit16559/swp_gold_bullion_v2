import 'package:flutter/material.dart';

class AppRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  void _log(String action, Route? route) {
    if (route?.settings.name != null) {
      debugPrint('🧭 Route $action → ${route!.settings.name}');
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    _log('pushed', route);
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _log('popped', previousRoute);
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _log('replaced', newRoute);
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}