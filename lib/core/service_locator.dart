import 'package:get_it/get_it.dart';

import 'network_config.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // locator.registerLazySingleton<SecurityProvider>(() => SecurityProvider());

  ///---Network---
  locator.registerSingleton<NetworkConfig>(NetworkConfig());

  ///---Repos---
  // locator.registerSingleton<AuthDataRepo>(AuthDataRepo());

  ///---Firebase---
  // locator.registerSingleton<RemoteConfigService>(RemoteConfigService());

  ///---Bloc---
  // locator.registerLazySingleton<HomeCubit>(() => HomeCubit());

  ///---Util---
  // locator.registerLazySingleton<UrlLauncher>(() => UrlLauncher());
}
