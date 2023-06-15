import 'package:cafe_app/src/main/app_navigation/app_navigation.dart';
import 'package:flutter/cupertino.dart';

class PageRoutes {
  static const String appNavigation = "/";

  Map<String, WidgetBuilder> routes() {
    return {
      appNavigation: (context) => const AppNavigation(),
    };
  }
}
