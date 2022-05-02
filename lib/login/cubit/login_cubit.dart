import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(const LoginState(status: LoginStatus.guest));

  final AuthRepository _authenticationRepository;

  Future<void> logInWithGoogle() async {
    emit(state.copyWith(status: () => LoginStatus.inProgress));
    try {
      await _authenticationRepository.logInWithGoogle();
      emit(state.copyWith(status: () => LoginStatus.loggedIn));
    } on LogInWithGoogleFailure catch (e) {
      emit(
        state.copyWith(errorMessage: () => e.message, status: () => LoginStatus.failure),
      );
    } catch (_) {
      emit(state.copyWith(status: () => LoginStatus.failure));
    }
  }
}
