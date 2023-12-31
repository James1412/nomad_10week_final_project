import 'package:final_project/features/authentication/login_screen.dart';
import 'package:final_project/features/authentication/signup_screen.dart';
import 'package:final_project/features/authentication/start_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) {
      return const StartScreen();
    },
  ),
  GoRoute(
    path: '/signup',
    builder: (context, state) {
      return const SignupScreen();
    },
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) {
      return const LoginScreen();
    },
  ),
]);
