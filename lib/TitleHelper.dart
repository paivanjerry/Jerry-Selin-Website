import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:jerryselin/routeList.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

class TitleHelper {

  void changePrevTitle(){
    Route<dynamic> prevRoute = NavigationHistoryObserver().history[NavigationHistoryObserver().history.length -2];
    String routeName = prevRoute.settings.name;
    String title = routeToTitle[routeName];
    SystemChrome.setApplicationSwitcherDescription(ApplicationSwitcherDescription(
        label: tr(title)
    ));
}
  void refreshTitle(){
    Route<dynamic> prevRoute = NavigationHistoryObserver().history[NavigationHistoryObserver().history.length -1];
    String routeName = prevRoute.settings.name;
    String title = routeToTitle[routeName];
    SystemChrome.setApplicationSwitcherDescription(ApplicationSwitcherDescription(
        label: tr(title)
    ));
  }
}