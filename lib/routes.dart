import 'package:final_project/features/authentication/login_screen.dart';
import 'package:final_project/features/authentication/repos/authentication_repository.dart';
import 'package:final_project/features/authentication/signup_screen.dart';
import 'package:final_project/features/authentication/start_screen.dart';
import 'package:final_project/features/home/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: '/',
      redirect: (context, state) {
        final isLoggedIn = ref.read(authRepo).isLoggedIn;
        if (!isLoggedIn) {
          if (state.subloc != SignupScreen.routeUrl &&
              state.subloc != LoginScreen.routeUrl) {
            return "/";
          }
        }
        return null;
      },
      routes: [
        GoRoute(
          path: '/',
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
          path: HomeScreen.routeUrl,
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    );
  },
);
