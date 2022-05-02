import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LegalText extends StatelessWidget {
  const LegalText({Key? key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text.rich(TextSpan(children: [
      const TextSpan(
          text: "By logging into Mahjong Ranking service, you accept "),
      TextSpan(
          text: "Terms of Service",
          style: const TextStyle(
              color: Colors.blue, decoration: TextDecoration.underline),
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              await launchUrl(Uri.parse(
                  "https://raw.githubusercontent.com/cvgore/mahjong_ranking_static/master/TOS.md"));
            }),
      const TextSpan(text: " and "),
      TextSpan(
          text: "Privacy Policy",
          style: const TextStyle(
              color: Colors.blue, decoration: TextDecoration.underline),
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              await launchUrl(
                Uri.parse(
                    "https://raw.githubusercontent.com/cvgore/mahjong_ranking_static/master/PRIVACY_POLICY.md"),
              );
            }),
      const TextSpan(text: "."),
    ]));
  }
}
