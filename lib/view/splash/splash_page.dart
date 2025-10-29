import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swp_gold_bullion_v2/core/constants/app_assets.dart';
import 'package:swp_gold_bullion_v2/core/constants/app_colors.dart';
import 'package:swp_gold_bullion_v2/core/constants/app_font_size.dart';
import 'package:swp_gold_bullion_v2/routes/route_paths.dart';
import 'package:swp_gold_bullion_v2/services/preferences_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    Timer(const Duration(seconds: 4), () {
      final seenIntro = PreferencesService.isShowIntro;
      if(seenIntro == true){
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutePaths.home,
          (route) => false,
        );
        return;
      }

      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutePaths.intro,
        (route) => false,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.background,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.backgroundSplash),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeIn,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppAssets.logoSplash,
                  width: 155.w,
                  height: 155.h,
                ),
                Text(
                  "Wellcome",
                  style: TextStyle(
                    fontSize: AppFontSize.textSize40,
                    fontWeight: FontWeight.w700,
                    color: AppColors.color654A15,
                  ),
                ),
                Text(
                  "ศูนย์ซื้อขาย\nทองคำแท่งครบวงจร",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppFontSize.textSize30,
                    fontWeight: FontWeight.w700,
                    color: AppColors.color7B0202,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}