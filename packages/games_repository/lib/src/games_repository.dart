import 'package:games_connector/games_connector.dart';

class GamesRepository {
  const GamesRepository({
    required GamesConnector connector,
  }) : _connector = connector;

  final GamesConnector _connector;

  Stream<List<Game>> getGames() => _connector.getGames();
}
