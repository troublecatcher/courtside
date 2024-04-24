import 'package:courtside/features/matches/view/matches_screen.dart';
import 'package:courtside/features/matches/model/game/game.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'connection.dart';

final matchInfoProvider = FutureProvider.autoDispose((ref) async {
  final params = {
    'gameID': ref.watch(gameIdProvider),
    // 'gameID': '20240107_SA@CLE',
    'fantasyPoints': 'true',
    'pts': '1',
    'stl': '3',
    'blk': '3',
    'reb': '1.25',
    'ast': '1.5',
    'TOV': '-1',
    'mins': '0',
    'doubleDouble': '0',
    'tripleDouble': '0',
    'quadDouble': '0',
  };

  final response = await GetIt.I<Dio>().get<Map<String, dynamic>>(
    '$baseUrl/getNBABoxScore',
    queryParameters: params,
    options: Options(
      headers: headers,
    ),
  );
  if (response.statusCode == 200) {
    return Game.fromJson(response.data!['body']);
  } else {
    throw Exception('Failed to load matches');
  }
});
