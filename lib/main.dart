import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:games_connector/games_connector.dart';
import 'package:games_repository/games_repository.dart';
import 'package:mahjong_ranking_app/app.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'package:offline_games_connector/offline_games_connector.dart';
import 'app_bloc_observer.dart';

Future<void> main() async {
  FlutterServicesBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  final gamesConnector = OfflineGamesConnector();

  bootstrap(gamesConnector: gamesConnector);
}

void bootstrap({required GamesConnector gamesConnector}) {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final gamesRepository = GamesRepository(connector: gamesConnector);

  runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(
          App(gamesRepository: gamesRepository),
        ),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
