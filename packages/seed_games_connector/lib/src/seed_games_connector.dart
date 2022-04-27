import 'dart:math';

import 'package:games_connector/games_connector.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

class SeedGamesConnector extends GamesConnector {
  SeedGamesConnector() {
    _gamesStreamController = BehaviorSubject<List<Game>>.seeded([
      for (var i = 0; i < 20; i++)
        Game(
            id: Uuid().v4obj(),
            finished: Random.secure().nextBool(),
            round: 3,
            wind: Wind.south,
            startedAt: DateTime.parse("2022-04-23T21:45:33Z"),
            scores: const [
              15000,
              3000,
              -7000,
              -11000
            ],
            players: [
              Player(
                  id: Uuid().v4obj(),
                  displayName: "John Doe",
                  usmaId: "TEST001"),
              Player(
                  id: Uuid().v4obj(),
                  displayName: "Jane Public",
                  usmaId: "TEST002"),
              Player(
                  id: Uuid().v4obj(),
                  displayName: "_nicknameLong123",
                  usmaId: "TEST003"),
              Player(id: Uuid().v4obj(), displayName: "Fredie", usmaId: "TEST004")
            ])
    ]);
  }

  late final BehaviorSubject<List<Game>> _gamesStreamController;

  @override
  Stream<List<Game>> getGames() => _gamesStreamController
      .asBroadcastStream()
      .delay(const Duration(seconds: 2));
}
