import 'package:auth_repository/auth_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_repository/games_repository.dart';
import 'package:mahjong_ranking_app/app/app.dart';
import 'package:mahjong_ranking_app/theme.dart';

class App extends StatelessWidget {
  const App(
      {Key? key, required this.gamesRepository, required this.authRepository})
      : super(key: key);

  final GamesRepository gamesRepository;
  final AuthRepository authRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (_) => gamesRepository),
          RepositoryProvider(create: (_) => authRepository)
        ],
        child: BlocProvider(
          create: (context) => AppBloc(
            authRepository: context.read<AuthRepository>(),
          ),
          child: const AppView(),
        ));
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        debugShowCheckedModeBanner: false,
        home: FlowBuilder<AppContextStatus>(
          state: context.select((AppBloc bloc) => bloc.state.status),
          onGeneratePages: onGenerateAppViewPages,
        ));
  }
}
