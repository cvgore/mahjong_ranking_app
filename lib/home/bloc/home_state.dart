part of 'home_bloc.dart';

enum HomeTab { rankings, games, account }

class HomeState extends Equatable {
  const HomeState({
    this.tab = HomeTab.games,
  });

  final HomeTab tab;

  @override
  List<Object> get props => [tab];
}
