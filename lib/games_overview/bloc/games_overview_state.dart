part of 'games_overview_bloc.dart';

enum GamesOverviewStatus { loading, success, failure }

class GamesOverviewState extends Equatable {
  const GamesOverviewState({
    this.status = GamesOverviewStatus.loading,
    this.games = const [],
  });

  final GamesOverviewStatus status;
  final List<Game> games;

  GamesOverviewState copyWith({
    GamesOverviewStatus Function()? status,
    List<Game> Function()? games,
  }) {
    return GamesOverviewState(
      status: status != null ? status() : this.status,
      games: games != null ? games() : this.games,
    );
  }

  @override
  List<Object?> get props => [status, games];
}
