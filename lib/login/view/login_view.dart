import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahjong_ranking_app/login/cubit/login_cubit.dart';

import 'login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mahjong Ranking")),
      body: BlocProvider(
        create: (_) => LoginCubit(context.read<AuthRepository>()),
        child: const LoginForm(),
      ),
    );
  }
}
