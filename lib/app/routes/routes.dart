import 'package:flutter/widgets.dart';
import 'package:mahjong_ranking_app/app/app.dart';
import 'package:mahjong_ranking_app/home/view/home_page.dart';
import 'package:mahjong_ranking_app/login/view/login_view.dart';

import '../../about/view/about_page.dart';

List<Page> onGenerateAppViewPages(
    AppContextStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppContextStatus.authenticated:
      return [HomePage.page(), AboutPage.page()];
    case AppContextStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
