import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

showFirebaseErrorSnack(BuildContext context, Object? error) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      (error as FirebaseException).message.toString().length >= 40
          ? "Something went wrong"
          : (error).message ?? "Something went wrong",
    ),
  ));
}
