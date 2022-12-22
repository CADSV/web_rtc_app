//Flutter imports
import 'package:flutter/material.dart';

//Project imports
import 'package:web_rtc_app/infrastructure/ui/request_call/request_call_page.dart';


///RoutesManager: Class that manages the app routes.
class RoutesManager {
  static Route getOnGenerateRoute(RouteSettings settings, {Object? arguments}) {
    switch (settings.name) {

      case  RequestCallPage.routeName:
        return MaterialPageRoute(builder: (context) =>  RequestCallPage());

      default:
        return MaterialPageRoute(builder: (context) =>  Container());
    }
  }
}