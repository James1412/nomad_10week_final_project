import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

showFirebaseErrorSnack(BuildContext context, Object? error) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      error is FirebaseException
          ? (error).message ?? "Something went wrong"
          : "Something went wrong",
    ),
  ));
}