import 'package:flutter/material.dart';

showFirebaseErrorSnack(BuildContext context, Object? error) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Wrong email or password"),
    ),
  );
}
