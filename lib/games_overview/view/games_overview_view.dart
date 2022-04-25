import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_repository/games_repository.dart';
import 'package:mahjong_ranking_app/games_overview/bloc/games_overview_bloc.dart';
import 'package:mahjong_ranking_app/games_overview/widgets/game_list_tile.dart';

class GamesOverviewPage extends StatelessWidget {
  const GamesOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GamesOverviewBloc(
        gamesRepository: context.read<GamesRepository>(),
      )..add(const GamesSubscriptionRequested()),
      child: const GamesOverviewView(),
    );
  }
}

class GamesOverviewView extends StatelessWidget {
  const GamesOverviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GamesOverviewBloc>().state;

    return MultiBlocListener(
      listeners: [
        BlocListener<GamesOverviewBloc, GamesOverviewState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status == GamesOverviewStatus.failure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Text("Failed to fetch games from server"),
                  ),
                );
            }
          },
        ),
      ],
      child: BlocBuilder<GamesOverviewBloc, GamesOverviewState>(
        builder: (context, state) {
          if (state.games.isEmpty) {
            if (state.status == GamesOverviewStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status != GamesOverviewStatus.success) {
              return const SizedBox();
            } else {
              return Center(
                child: Text(
                  "No games found",
                  style: Theme.of(context).textTheme.caption,
                ),
              );
            }
          }

          return Scrollbar(
            child: ListView(
              children: [
                for (final game in state.games)
                  GameListTile(
                    game: game,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
