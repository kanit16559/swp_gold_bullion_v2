import 'package:flutter/material.dart';
import 'package:swp_gold_bullion_v2/core/config/app_config.dart';
import 'package:swp_gold_bullion_v2/core/config/flavor.dart';
import 'package:swp_gold_bullion_v2/core/constants/app_strings.dart';
import 'package:swp_gold_bullion_v2/core/constants/base_url_constant.dart';
import 'package:swp_gold_bullion_v2/core/services/dependency_injection.dart';
import 'package:swp_gold_bullion_v2/services/preferences_service.dart';
import 'package:swp_gold_bullion_v2/swp_gold_bullion_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesService.init();

  final appConfig = AppConfig.create(
    flavor: Flavor.prod,
    baseUrl: BaseUrlConstant.urlProd,
    appName: AppStrings.appNameProd,
  );

  setupDependencies(appConfig: appConfig);

  swpGoldBullionApp();
}