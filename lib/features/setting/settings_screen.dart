import 'package:final_project/features/authentication/repos/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends ConsumerWidget {
  static const routeUrl = '/settings';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("Licenses"),
            onTap: () => showAboutDialog(
              context: context,
            ),
          ),
          SwitchListTile.adaptive(
            title: const Text(
              "Dark mode",
              style: TextStyle(),
            ),
            value: true,
            onChanged: (value) {},
          ),
          ListTile(
            title: const Text(
              "Log out",
              style: TextStyle(),
            ),
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: const Text("Leave the app?"),
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
        ],
      ),
    );
  }
}
