import 'models/game.dart';

abstract class GamesConnector {
  const GamesConnector();

  Stream<List<Game>> getGames();
}

class GameNotFoundException implements Exception {}