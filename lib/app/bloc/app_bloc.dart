import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AppState(
            status: AppContextStatus.unauthenticated,
            networkConnected: true,
            user: User.empty)) {
    if (authRepository.currentUser.isNotEmpty) {
      add(AppUserChanged(authRepository.currentUser));
    }

    on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    on<AppNetworkStateChanged>(_onNetworkStateChanged);
    _userSubscription = _authRepository.user.listen(
      (user) => add(AppUserChanged(user)),
    );
    _connectionStateSubscription = Connectivity().onConnectivityChanged.listen(
        (result) => add(AppNetworkStateChanged(
            result == ConnectivityResult.mobile ||
                result == ConnectivityResult.wifi ||
                result == ConnectivityResult.ethernet)));
  }

  final AuthRepository _authRepository;
  late final StreamSubscription<User> _userSubscription;
  late final StreamSubscription<ConnectivityResult>
      _connectionStateSubscription;

  void _onUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    emit(
      event.user.isNotEmpty
          ? state.authenticate(event.user)
          : state.deauthenticate(),
    );
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    unawaited(_authRepository.logOut());
  }

  void _onNetworkStateChanged(
      AppNetworkStateChanged event, Emitter<AppState> emit) {
    emit(state.copyWith(networkConnected: () => event.connected));
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
