import 'package:flutter/material.dart';

void showSnackBar(
  BuildContext context,
  String message, {
  SnackBarAction? action,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 5),
      showCloseIcon: true,
      content: Text(message),
    ),
  );
}

showMyDialog(
  BuildContext context, {
  required void Function()? onOkay,
  String? title,
  String? message,
}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title ?? "Alert"),
          content: Text(message ?? ""),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: onOkay,
              child: const Text("Ok"),
            ),
          ],
        );
      });
}
