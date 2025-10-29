import 'package:get_it/get_it.dart';
import 'package:swp_gold_bullion_v2/core/config/app_config.dart';
import 'package:swp_gold_bullion_v2/core/config/app_runtime_config.dart';
import 'package:swp_gold_bullion_v2/core/network/network_status_service.dart';
import 'package:swp_gold_bullion_v2/view_model/intro/intro_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies({required AppConfig appConfig}) async {

  final runtimeConfig = AppRuntimeConfig();
  await runtimeConfig.init();

  // --- Register global config ---
  getIt.registerSingleton<AppConfig>(appConfig);
  getIt.registerSingleton<AppRuntimeConfig>(runtimeConfig);

  // --- Core services ---
  getIt.registerSingleton<NetworkStatusService>(NetworkStatusService());




  // --- View Model ---
  getIt.registerFactory<IntroCubit>(()=> IntroCubit());

}