import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahjong_ranking_app/app/view/account_view.dart';
import 'package:mahjong_ranking_app/games_overview/view/view.dart';

import '../../about/view/about_page.dart';
import '../bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage(child: HomePage());

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

  Widget? _buildFloatingActionButton(BuildContext context) {
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);

    switch (selectedTab) {
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
        title: const Text("USMA"),
        actions: [
          ..._appBarActions(context, selectedTab),
        ],
      ),
      body: IndexedStack(
        index: selectedTab.index,
        children: const [
          Text("Ranking"),
          GamesOverviewPage(),
          AccountViewPage()
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: selectedTab.index,
        onItemSelected: (value) => _onBottomNavyBarItemSelected(context, value),
        items: [
          for (final tab in HomeTab.values)
            BottomNavyBarItem(
              icon: Icon(tab.toIconData()),
              title: Text(tab.toTitle()),
              activeColor: tab.toColor(),
            )
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  void _onBottomNavyBarItemSelected(BuildContext context, int value) {
    context.read<HomeCubit>().setTab(HomeTab.values.elementAt(value));
  }

  Iterable<Widget> _appBarActions(
      BuildContext context, HomeTab selectedTab) sync* {
    if (selectedTab == HomeTab.account) {
      yield IconButton(
          icon: const Icon(Icons.info_outline),
          onPressed: () async =>
              await Navigator.of(context).push(AboutPage.route()));
    }
  }
}
