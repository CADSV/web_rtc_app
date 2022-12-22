//Flutter imports
import 'package:flutter/material.dart';

//Project imports


///RoutesManager: Class that manages the app routes.
class RoutesManager {
  static Route getOnGenerateRoute(RouteSettings settings, {Object? arguments}) {
    switch (settings.name) {

      default:
        return MaterialPageRoute(builder: (context) =>  Container());
    }
  }
}