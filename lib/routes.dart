import 'package:final_project/features/authentication/signup_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/signup',
    builder: (context, state) {
      return const SignupScreen();
    },
  ),
]);
