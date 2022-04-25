import 'package:games_connector/games_connector.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

class OfflineGamesConnector extends GamesConnector {
  OfflineGamesConnector();

  final _gamesStreamController = BehaviorSubject<List<Game>>.seeded([
    Game(
        id: UuidValue("a9fe279b-c58a-4b98-a9f9-d885b0cdb98f"),
        finished: true,
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
              id: UuidValue("1d6a8dff-801c-4ce6-ade1-bb8a52a28169"),
              displayName: "John Doe",
              usmaId: "TEST001"),
          Player(
              id: UuidValue("1676966b-af64-422f-92f8-4a43d1e1dbfb"),
              displayName: "Jane Public",
              usmaId: "TEST002"),
          Player(
              id: UuidValue("beed2f92-79ff-40ce-b2c9-ecda12b054a0"),
              displayName: "_nickname",
              usmaId: "TEST003"),
          Player(
              id: UuidValue("e077fe19-0a2a-43f9-b8a7-5fe91d3f04f7"),
              displayName: "Fred",
              usmaId: "TEST004")
        ])
  ]);

  @override
  Stream<List<Game>> getGames() => _gamesStreamController.asBroadcastStream();
}
