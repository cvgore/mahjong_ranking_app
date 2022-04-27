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

  Widget? _getFloatingActionButton(BuildContext context) {
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);

    switch(selectedTab) {
      case HomeTab.games:
        return FloatingActionButton(
          child: const Icon(Icons.add),
          tooltip: "New game",
          onPressed: () => {
            // Navigator.of(context).push()
          },
        );
      case HomeTab.ranking:
        return FloatingActionButton(
          child: const Icon(Icons.compare_arrows),
          tooltip: "Change ranking",
          onPressed: () => {
            // Navigator.of(context).push()
          },
        );
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedTab.toTitle()),
        backgroundColor: selectedTab.toColor(),
      ),
      body: IndexedStack(
        index: selectedTab.index,
        children: const [Text("Ranking"), GamesOverviewPage(), Text("Account")],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: selectedTab.index,
        onItemSelected: (value) => _onBottomNavyBarItemSelected(context, value),
        items: [
          for(final tab in HomeTab.values)
            BottomNavyBarItem(
                icon: Icon(tab.toIconData()),
                title: Text(tab.toTitle()),
                activeColor: tab.toColor(),
            )
        ],
      ),
      floatingActionButton: _getFloatingActionButton(context),
    );
  }

  void _onBottomNavyBarItemSelected(BuildContext context, int value) {
    context.read<HomeCubit>().setTab(HomeTab.values.elementAt(value));
  }
}
