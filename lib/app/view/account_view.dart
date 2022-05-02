import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahjong_ranking_app/app/app.dart';

class AccountViewPage extends StatelessWidget {
  const AccountViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AccountViewView();
  }
}

class AccountViewView extends StatelessWidget {
  const AccountViewView({Key? key}) : super(key: key);

  Widget _buildAvatarPlaceholder() {
    return const Icon(Icons.person);
  }

  Widget _buildAvatar(AppState state) {
    if (state.user.photo != null) {
      return Image.network(
        state.user.photo!,
        loadingBuilder: (_, child, progress) =>
            progress != null ? _buildAvatarPlaceholder() : child,
        errorBuilder: (_, __, ___) => _buildAvatarPlaceholder(),
        width: 96,
        height: 96,
      );
    }
    return _buildAvatarPlaceholder();
  }

  void _logout(BuildContext context) {
    context.read<AppBloc>().add(AppLogoutRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      final theme = Theme.of(context);
      final isConnected = state.networkConnected;

      return Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  _buildAvatar(state),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(state.user.name!,
                            style: theme.textTheme.headline5),
                      ),
                      Text(state.user.email!, style: theme.textTheme.caption),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        AccountViewListTile(
                            text: state.user.id,
                            icon: const Icon(Icons.person_search)),
                        AccountViewListTile(
                            text: isConnected ? "connected" : "disconnected",
                            icon: const Icon(Icons.wifi))
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () => _logout(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(right: 8),
                                child: const Icon(Icons.logout),
                              ),
                              const Text('Logout'),
                            ],
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
