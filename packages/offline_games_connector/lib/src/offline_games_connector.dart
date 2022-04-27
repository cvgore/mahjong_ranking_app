import 'dart:math';

import 'package:games_connector/games_connector.dart';

class OfflineGamesConnector extends GamesConnector {
  OfflineGamesConnector() {
    _gamesStreamController = Stream.fromIterable([]);
  }

  late final _gamesStreamController;

  @override
  Stream<List<Game>> getGames() => _gamesStreamController.asBroadcastStream();
}
