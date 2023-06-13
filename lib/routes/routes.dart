import 'package:cafe_app/src/main/app_navigation/app_navigation.dart';
import 'package:flutter/material.dart';

class PageRoutes {
  static const String appNavigation = "/";
  //     "rashodPrihodWarehouseQrScanner";

  Map<String, WidgetBuilder> routes() {
    return {
      appNavigation: (context) => const AppNavigation(),
    };
  }
}
