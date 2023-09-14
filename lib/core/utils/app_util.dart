import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppUtil {
  static void debugPrint(var value) {
    if (kDebugMode) print(value);
  }

  static bool checkIsNull(value) {
    return [null, "null", ""].contains(value);
  }

  static showSnackbar(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
