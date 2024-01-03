import 'package:final_project/constants/sizes.dart';
import 'package:final_project/firebase_options.dart';
import 'package:final_project/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

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
        primaryColor: Colors.lightBlue.shade100,
        textTheme: GoogleFonts.robotoSlabTextTheme(Theme.of(context).textTheme),
        sliderTheme: SliderThemeData(
          thumbColor: Colors.lightBlue.shade100,
          activeTrackColor: Colors.lightBlue.shade100,
          inactiveTrackColor: Colors.lightBlue.shade50,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.lightBlue.shade100,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: Sizes.size20,
          ),
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
