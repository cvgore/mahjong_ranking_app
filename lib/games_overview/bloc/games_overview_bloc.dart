import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:games_repository/games_repository.dart';

part 'games_overview_event.dart';

part 'games_overview_state.dart';

class GamesOverviewBloc extends Bloc<GamesOverviewEvent, GamesOverviewState> {
  GamesOverviewBloc({required GamesRepository gamesRepository})
      : _gamesRepository = gamesRepository,
        super(const GamesOverviewState()) {
    on<GamesSubscriptionRequested>(_onSubscriptionRequested);
  }

  final GamesRepository _gamesRepository;

  Future<void> _onSubscriptionRequested(
      GamesSubscriptionRequested event,
      Emitter<GamesOverviewState> emit,
      ) async {
    emit(state.copyWith(
        status: () => GamesOverviewStatus.loading,
        games: () => []
    ));

    await emit.forEach<List<Game>>(
      _gamesRepository.getGames(),
      onData: (games) => state.copyWith(
        status: () => GamesOverviewStatus.success,
        games: () => games,
      ),
      onError: (_, __) => state.copyWith(
        status: () => GamesOverviewStatus.failure,
      ),
    );
  }
}
