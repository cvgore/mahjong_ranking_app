import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahjong_ranking_app/games_overview/view/view.dart';

import '../bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);

    return Scaffold(
      body: IndexedStack(
        index: selectedTab.index,
        children: const [Text("Ranking"), GamesOverviewPage(), Text("Account")],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: selectedTab.index,
        onItemSelected: (value) => _onBottomNavyBarItemSelected(context, value),
        items: [
          BottomNavyBarItem(
              icon: const Icon(Icons.list_alt_outlined),
              title: const Text("Ranking"),
              activeColor: Colors.deepPurpleAccent
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.gamepad_outlined),
            title: const Text("Games"),
            activeColor: Colors.lightBlueAccent
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Account"),
              activeColor: Colors.red
          ),
        ],
      ),
    );
  }

  void _onBottomNavyBarItemSelected(BuildContext context, int value) {
    context.read<HomeCubit>().setTab(HomeTab.values.elementAt(value));
  }
}
