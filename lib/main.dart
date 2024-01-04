import 'package:final_project/features/dark_mode/repos/dark_mode_repository.dart';
import 'package:final_project/features/dark_mode/view_models/dark_mode_config_view_model.dart';
import 'package:final_project/firebase_options.dart';
import 'package:final_project/routes.dart';
import 'package:final_project/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final preferences = await SharedPreferences.getInstance();
  final repository = DarkModeConfigRepository(preferences);
  runApp(
    ProviderScope(
      overrides: [
        darkmodeConfigProvider.overrideWith(
          () => DarkModeConfigViewModel(repository),
        ),
      ],
      child: const MoodTrackerApp(),
    ),
  );
}

class MoodTrackerApp extends ConsumerWidget {
  const MoodTrackerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      debugShowCheckedModeBanner: false,
      theme: lightMode(context),
      darkTheme: darkMode(context),
      themeMode: ref.watch(darkmodeConfigProvider).darkMode
          ? ThemeMode.dark
          : ThemeMode.light,
    );
  }
}
