part of 'app_bloc.dart';

enum AppContextStatus {
  authenticated,
  unauthenticated,
}

class AppState extends Equatable {
  const AppState({
    required this.status,
    required this.networkConnected,
    this.user = User.empty,
  });

  AppState authenticate(User user) {
    return AppState(
        user: user,
        status: AppContextStatus.authenticated,
        networkConnected: networkConnected);
  }

  AppState deauthenticate() {
    return AppState(
        user: User.empty,
        status: AppContextStatus.unauthenticated,
        networkConnected: networkConnected);
  }

  AppState copyWith(
      {User Function()? user,
      AppContextStatus Function()? status,
      bool Function()? networkConnected}) {
    return AppState(
        user: user == null ? this.user : user(),
        status: status == null ? this.status : status(),
        networkConnected: networkConnected == null
            ? this.networkConnected
            : networkConnected());
  }

  final AppContextStatus status;
  final User user;
  final bool networkConnected;

  @override
  List<Object> get props => [status, user, networkConnected];
}
