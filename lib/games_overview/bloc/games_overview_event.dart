part of 'games_overview_bloc.dart';

abstract class GamesOverviewEvent extends Equatable {
  const GamesOverviewEvent();

  @override
  List<Object> get props => [];
}

class GamesSubscriptionRequested extends GamesOverviewEvent {
  const GamesSubscriptionRequested();
}