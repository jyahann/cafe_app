import 'package:flutter/foundation.dart';

class Helper {
  static void debugPrint(Object? object) {
    if (kDebugMode) {
      print(object);
    }
  }
}
