import 'package:final_project/features/authentication/repos/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  static const routeUrl = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ListTile(
          title: const Text(
            "Log out (IOS)",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          onTap: () {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: const Text("Leave"),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () {
                        Navigator.of(context).pop(context);
                      },
                      child: const Text(
                        "No",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CupertinoDialogAction(
                      isDestructiveAction: true,
                      child: const Text("Yes"),
                      onPressed: () {
                        ref.read(authRepo).signOut();
                        context.go('/');
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
