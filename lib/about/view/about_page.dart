import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mahjong_ranking_app/about/view/license_page.dart'
    as license_page;
import 'package:mahjong_ranking_app/about/widgets/LegalText.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage(child: AboutPage());

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const AboutPage());
  }

  void _back(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("About Mahjong Ranking"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            onPressed: () => _back(context),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text("Mahjong Ranking",
                          style: theme.textTheme.titleLarge),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _appVersion(context),
                    ),
                    const Text("Licensed under GPLv2"),
                    const Spacer(),
                    const LegalText(),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _showLicensesButton(context),
                    _getRepository(context),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Future<PackageInfo> _getPackageInfo() {
    return PackageInfo.fromPlatform();
  }

  FutureBuilder _appVersion(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: _getPackageInfo(),
      builder: (context, snapshot) {
        final theme = Theme.of(context);

        if (snapshot.connectionState != ConnectionState.done) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          log("could not get package info data");
          log(snapshot.error.toString());
          return Container();
        }

        return Center(
          child: Column(
            children: [
              Text("${snapshot.data!.version} ${snapshot.data!.buildNumber}",
                  style: theme.textTheme.labelSmall),
              Text(snapshot.data!.buildSignature,
                  style: theme.textTheme.labelSmall),
            ],
          ),
        );
      },
    );
  }

  Widget _showLicensesButton(BuildContext context) {
    return ElevatedButton(
      child: Row(
        children: const [
          Icon(Icons.line_style),
          Text("3rd party licenses"),
        ],
      ),
      onPressed: () =>
          Navigator.of(context).push(license_page.LicensePage.route()),
    );
  }

  Widget _getRepository(BuildContext context) {
    return ElevatedButton(
      child: Row(
        children: const [
          Icon(Icons.bug_report_outlined),
          Text("Repository"),
        ],
      ),
      onPressed: () async => launchUrl(
          Uri.parse("https://github.com/cvgore/mahjong_ranking_app"),
          mode: LaunchMode.externalApplication),
    );
  }
}
