import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jerryselin/pages/DeveloperPage.dart';
import 'package:jerryselin/pages/EntrepreneurPage.dart';
import 'package:jerryselin/pages/MainPage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jerryselin/pages/OtherPage.dart';
import 'package:audio_service/audio_service.dart';

import 'package:navigation_history_observer/navigation_history_observer.dart';


import 'package:jerryselin/pages/SkateVideoPage.dart';
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';

void main() {
  configureApp();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('fi')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: MyApp()
    )
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      navigatorObservers: [NavigationHistoryObserver()],
      initialRoute: '/',
      title: "Jerry Selin",
      routes: {
        '/': (context) => AudioServiceWidget(child: MainPage()),
        '/skatevideos': (context) => SkateVideoPage(),
        '/other': (context) => OtherPage(),
        '/developer': (context) => DeveloperPage(),
        '/entrepreneur': (context) => EntrepreneurPage(),
      },
      theme: ThemeData(
        fontFamily: 'Lato',
        primarySwatch: Colors.deepPurple,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

