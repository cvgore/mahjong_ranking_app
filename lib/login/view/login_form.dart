import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahjong_ranking_app/about/widgets/LegalText.dart';
import 'package:mahjong_ranking_app/login/cubit/login_cubit.dart';
import 'package:mahjong_ranking_app/theme.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status == LoginStatus.failure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ??
                      "Unknown error occured while trying to log in"),
                ),
              );
          }
        },
        child: Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _generateBanner(context),
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    _GoogleLoginButton(),
                    const Spacer(),
                    const LegalText()
                  ],
                )),
              ],
            )));
  }

  Widget _generateBanner(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
        child: Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 32),
          child: Text("Login to Mahjong Ranking service",
              style: theme.textTheme.titleLarge),
        ),
        const Text(
            "Tenancy administrator must then assign your email address to player."
            " Tenancy administrator will be notified about it."),
      ],
    ));
  }
}

class _GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GoogleAuthButton(
      key: const Key('loginForm_googleLogin_raisedButton'),
      isLoading:
          context.read<LoginCubit>().state.status == LoginStatus.inProgress,
      onPressed: () => context.read<LoginCubit>().logInWithGoogle(),
      darkMode: theme == AppTheme.dark,
    );
  }
}
