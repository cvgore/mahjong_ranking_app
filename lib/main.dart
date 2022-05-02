import 'dart:async';
import 'dart:developer';

import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'package:games_connector/games_connector.dart';
import 'package:games_repository/games_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mahjong_ranking_app/app/app.dart';
import 'package:mahjong_ranking_app/config.dart';
import 'package:mahjong_ranking_app/firebase_options.dart';

Future<void> main() async {
  FlutterServicesBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  final gamesConnector = SeedGamesConnector();

  bootstrap(gamesConnector: gamesConnector);
}

void bootstrap({required GamesConnector gamesConnector}) {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final gamesRepository = GamesRepository(connector: gamesConnector);
  late final AuthRepository authRepository;

  runZonedGuarded(
    () async {
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);

      if (Config.useFirebaseAuthEmulator) {
        await FirebaseAuth.instance.useAuthEmulator("localhost", 9099);
      }

      authRepository = AuthRepository(
          googleSignIn: GoogleSignIn(
              clientId: Config.googleClientId, scopes: ["profile", "email"]));
      await BlocOverrides.runZoned(
        () async => runApp(
          App(gamesRepository: gamesRepository, authRepository: authRepository),
        ),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
