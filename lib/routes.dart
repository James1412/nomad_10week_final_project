import 'package:final_project/features/authentication/login_screen.dart';
import 'package:final_project/features/authentication/repos/authentication_repository.dart';
import 'package:final_project/features/authentication/signup_screen.dart';
import 'package:final_project/features/authentication/start_screen.dart';
import 'package:final_project/features/main_navigation/main_navigation.dart';
import 'package:final_project/features/setting/settings_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: MainNavigationScreen.routeUrl,
      redirect: (context, state) {
        final isLoggedIn = ref.read(authRepo).isLoggedIn;
        if (!isLoggedIn) {
          if (state.subloc != SignupScreen.routeUrl &&
              state.subloc != LoginScreen.routeUrl &&
              state.subloc != StartScreen.routeUrl) {
            return StartScreen.routeUrl;
          }
        }
        return null;
      },
      routes: [
        GoRoute(
          path: StartScreen.routeUrl,
          builder: (context, state) => const StartScreen(),
        ),
        GoRoute(
          path: SignupScreen.routeUrl,
          builder: (context, state) => const SignupScreen(),
        ),
        GoRoute(
          path: LoginScreen.routeUrl,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: SettingsScreen.routeUrl,
          builder: (context, state) => const SettingsScreen(),
        ),
        GoRoute(
          path: "/:tab(public|write|private)",
          name: MainNavigationScreen.routeName,
          builder: (context, state) {
            final tab = state.params["tab"]!;
            return MainNavigationScreen(tab: tab);
          },
        )
      ],
    );
  },
);
