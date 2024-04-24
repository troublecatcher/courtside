import 'package:courtside/app/init/firebase_options.dart';
import 'package:courtside/app/init/remote_config_service.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:courtside/app/main.dart';

Future<void> initDI() async {
  final getIt = GetIt.I;
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await remoteConfig.fetchAndActivate();
  final remoteConfigService = RemoteConfigService(remoteConfig);
  getIt.registerSingleton<RemoteConfigService>(remoteConfigService);

  getIt.registerSingleton<Dio>(Dio());
}
