part of 'login_cubit.dart';

enum LoginStatus { guest, inProgress, loggedIn, failure }

class LoginState extends Equatable {
  const LoginState({this.errorMessage, required this.status});

  final String? errorMessage;
  final LoginStatus status;

  LoginState copyWith({
    String? Function()? errorMessage,
    LoginStatus Function()? status,
  }) {
    return LoginState(
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
      status: status != null ? status() : this.status,
    );
  }

  @override
  List<Object?> get props => [status];
}
