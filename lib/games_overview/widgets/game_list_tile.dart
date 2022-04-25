import 'package:flutter/material.dart';
import 'package:games_connector/games_connector.dart';

class GameListTile extends StatelessWidget {
  const GameListTile({
    Key? key,
    required this.game,
    this.onTap,
  }) : super(key: key);

  final Game game;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      onTap: onTap,
      title: Text(
        game.players.map((e) => e.displayName).join(", "),
        maxLines: 2
      ),
      subtitle: Text(
        game.startedAt.toString(),
        maxLines: 1,
      ),
      trailing: game.finished
          ? const Text("Finish")
          : Text("${game.wind.toSymbol()}${game.round}"),
    );
  }
}
