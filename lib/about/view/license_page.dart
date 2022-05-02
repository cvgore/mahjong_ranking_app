import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as flutter;

class LicensePage extends StatelessWidget {
  const LicensePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage(child: LicensePage());

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LicensePage());
  }

  @override
  Widget build(BuildContext context) {
    return const flutter.LicensePage();
  }
}
