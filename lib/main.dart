import 'package:flutter/material.dart';

import 'dart:io';

//import 'data/themes/theme.dart';
import 'pages/announcements_page.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() {
  HttpOverrides.global = MyHttpOverrides();
  timeago.setLocaleMessages('el', timeago.GrMessages());
  runApp(const CSIHUBuddy());
}

class CSIHUBuddy extends StatelessWidget {
  const CSIHUBuddy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final ThemeData theme = CustomTheme.light();
    return const MaterialApp(
      //theme: theme,
      title: 'CSIHU Buddy',
      home: AnnouncementsPage(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
