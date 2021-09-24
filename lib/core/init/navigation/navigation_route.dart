import '../../../view/bid/create/view/create_view.dart';
import '../../../view/bid/list/view/bid_list_view.dart';
import '../../../view/sport/view/sport_view.dart';
import '../../../view/bookmaker/view/bookmaker_view.dart';
import '../../../view/settings/view/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../components/card/not_found_navigation_widget.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.SETTINGS_VIEW:
        return normalNavigate(SettingsView(), RouteSettings(name: NavigationConstants.SETTINGS_VIEW));
      case NavigationConstants.HOME_VIEW:
        return normalNavigate(BidListView(), RouteSettings(name: NavigationConstants.HOME_VIEW));
      case NavigationConstants.CREATE_VIEW:
        return normalNavigate(CreateView(data: args.arguments), RouteSettings(name: NavigationConstants.CREATE_VIEW));
      case NavigationConstants.BOOKMAKER_LIST_VIEW:
        return normalNavigate(BookmakerView(data: args.arguments), RouteSettings(name: NavigationConstants.BOOKMAKER_LIST_VIEW));
      case NavigationConstants.SPORT_LIST_VIEW:
        return normalNavigate(SportView(data: args.arguments), RouteSettings(name: NavigationConstants.SPORT_LIST_VIEW));
      default:
        return normalNavigate(NotFoundNavigationWidget(), RouteSettings(name: 'Not found'));
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }
}
