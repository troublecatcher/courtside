import 'package:courtside/app/init/remote_config_service.dart';
import 'package:get_it/get_it.dart';

const baseUrl = 'https://tank01-fantasy-stats.p.rapidapi.com';
final headers = {
  'X-RapidAPI-Key': GetIt.I<RemoteConfigService>().key,
  'X-RapidAPI-Host': 'tank01-fantasy-stats.p.rapidapi.com'
};
