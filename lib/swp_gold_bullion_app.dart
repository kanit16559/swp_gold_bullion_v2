import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:swp_gold_bullion_v2/core/config/app_config.dart';
import 'package:swp_gold_bullion_v2/core/constants/app_colors.dart';
import 'package:swp_gold_bullion_v2/core/services/dependency_injection.dart';
import 'package:swp_gold_bullion_v2/routes/app_route_observer.dart';
import 'package:swp_gold_bullion_v2/routes/app_router.dart';
import 'package:swp_gold_bullion_v2/routes/route_paths.dart';
import 'package:swp_gold_bullion_v2/view_model/intro/intro_cubit.dart';

final RouteObserver<PageRoute> routeObserver = AppRouteObserver();

void swpGoldBullionApp() {
  runApp(
      MySwpGoldBullionApp()
  );
}

final navigatorKey = GlobalKey<NavigatorState>();

class MySwpGoldBullionApp extends StatefulWidget {
  const MySwpGoldBullionApp({super.key});

  @override
  State<MySwpGoldBullionApp> createState() => _MySwpGoldBullionAppState();
}

class _MySwpGoldBullionAppState extends State<MySwpGoldBullionApp> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      /// TODO : กรณีดักตอนเช็ค Login
      // final isLoggedIn = await viewModel.checkLoginStatus();
      // if (!mounted) return;
      // Navigator.pushReplacementNamed(
      //   context,
      //   isLoggedIn ? RoutePaths.home : RoutePaths.login,
      // );
      // Navigator.pushReplacementNamed(
      //   context,
      //   RoutePaths.home,
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<IntroCubit>(
                create: (BuildContext context) => getIt<IntroCubit>(),
              ),
            ],
            child: GlobalLoaderOverlay(
              duration: Durations.medium4,
              reverseDuration: Durations.medium4,
              overlayColor: Colors.grey.withOpacity(0.8),
              overlayWidgetBuilder: (_) {
                return _buildLoaderOverlayWidget();
              },
              child: MaterialApp(
                title: AppConfig.shared.appName,
                color: AppColors.background,
                builder: (context,
                    child) { // Lock การปรับขนาดตัวอักษรจาก setting
                  return MediaQuery(
                      data: MediaQuery.of(context).copyWith(
                          textScaler: const TextScaler.linear(1.0)),
                      child: child!
                  );
                },
                theme: ThemeData(
                    useMaterial3: true,
                    fontFamily: "Prompt"
                ),
                navigatorKey: navigatorKey,
                locale: const Locale('th'),
                debugShowCheckedModeBanner: false,
                initialRoute: RoutePaths.splash,
                onGenerateRoute: AppRouter.onGenerateRoute,
                navigatorObservers: [routeObserver],
              ),
            ),
          );
        }
    );
  }

  Widget _buildLoaderOverlayWidget() {
    return Center(
      child: SpinKitCircle(
        color: AppColors.colorBD1E2E,
        size: 80.r,
      ),
    );
  }
}




