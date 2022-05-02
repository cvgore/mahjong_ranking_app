import 'dart:math';

import 'package:flutter/material.dart';
import 'package:games_connector/games_connector.dart';
import 'package:intl/intl.dart';

class GameListTile extends StatelessWidget {
  const GameListTile({
    Key? key,
    required this.game,
    this.onTap,
  }) : super(key: key);

  final Game game;
  final VoidCallback? onTap;

  Iterable<Widget> _playersList(BuildContext context) sync* {
    final theme = Theme.of(context);

    final curplayer = Random.secure().nextInt(game.players.length);
    for (var i = 0; i < game.players.length; i++) {
      final player = game.players[i];

      yield Text(player.displayName,
          style: i == curplayer ? TextStyle(inherit: true, color: Color(theme.colorScheme.secondary.value)) : null);

      if (player != game.players.last) {
        yield const Text(" ");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      onTap: onTap,
      title: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.start,
        clipBehavior: Clip.antiAlias,
        children: [..._playersList(context)],
      ),
      subtitle: Text(
        DateFormat.yMd(Intl.systemLocale).add_jm().format(game.startedAt),
        maxLines: 1,
      ),
      trailing: game.finished
          ? Text("end", style: theme.textTheme.titleMedium)
          : Text("${game.wind.toSymbol()} ${game.round}", style: theme.textTheme.titleMedium),
    );
  }
}
