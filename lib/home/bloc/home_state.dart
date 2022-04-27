part of 'home_bloc.dart';

enum HomeTab { ranking, games, account }

class HomeState extends Equatable {
  const HomeState({
    this.tab = HomeTab.games,
  });

  final HomeTab tab;

  @override
  List<Object> get props => [tab];
}

extension HomeTabExtensions on HomeTab {
  String toTitle() {
    switch (this) {
      case HomeTab.games:
        return "Games";
      case HomeTab.account:
        return "Account";
      case HomeTab.ranking:
        return "Ranking";
    }
  }

  Color toColor() {
    switch (this) {
      case HomeTab.ranking:
        return Colors.deepPurpleAccent;
      case HomeTab.games:
        return Colors.lightBlueAccent;
      case HomeTab.account:
        return Colors.red;
    }
  }

  IconData toIconData() {
    switch (this) {
      case HomeTab.games:
        return Icons.gamepad_outlined;
      case HomeTab.account:
        return Icons.person_outline;
      case HomeTab.ranking:
        return Icons.list_alt_outlined;
    }
  }
}