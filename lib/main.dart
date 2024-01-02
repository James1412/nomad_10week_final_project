import 'package:final_project/constants/sizes.dart';
import 'package:final_project/firebase_options.dart';
import 'package:final_project/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MoodTrackerApp()));
}

class MoodTrackerApp extends ConsumerWidget {
  const MoodTrackerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 241, 223, 195),
        appBarTheme: const AppBarTheme(
          elevation: 1,
          color: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.black,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1.5,
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(
              Sizes.size10,
            ),
          ),
        ),
      ),
    );
  }
}
