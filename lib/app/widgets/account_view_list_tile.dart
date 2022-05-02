import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccountViewListTile extends StatelessWidget {
  const AccountViewListTile({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final Icon icon;
  final String text;

  void _copyAndNotify(BuildContext context) {
    Clipboard.setData(ClipboardData(text: text));

    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(const SnackBar(content: Text("Information copied to clipboard")));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: icon,
      title: Text(text),
      dense: true,
      onLongPress: () => _copyAndNotify(context),
    );
  }
}
