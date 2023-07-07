import 'package:betweener/core/util/constants.dart';
import 'package:flutter/material.dart';

class Helpers {
  static void showSnackbar(BuildContext context,
      {required String message, Color color = kPrimaryColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Container(
            padding: const EdgeInsets.all(16),
            height: 50,
            decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Text(message)),
        margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
        backgroundColor: Colors.transparent,
        dismissDirection: DismissDirection.none,
        elevation: 0,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
