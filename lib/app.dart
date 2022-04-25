import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_repository/games_repository.dart';
import 'package:mahjong_ranking_app/theme.dart';

import 'home/view/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.gamesRepository}) : super(key: key);

  final GamesRepository gamesRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: gamesRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
