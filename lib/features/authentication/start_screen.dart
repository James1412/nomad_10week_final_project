import 'package:final_project/constants/gaps.dart';
import 'package:final_project/constants/sizes.dart';
import 'package:final_project/features/authentication/widgets/account_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class StartScreen extends ConsumerStatefulWidget {
  const StartScreen({super.key});

  @override
  ConsumerState<StartScreen> createState() => SignupScreenState();
}

class SignupScreenState extends ConsumerState<StartScreen> {
  void _onSignupTap() {
    context.push('/signup');
  }

  void _onLoginTap() {
    context.push('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size14,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(),
              ),
              const Flexible(
                flex: 1,
                child: FaIcon(
                  FontAwesomeIcons.mugHot,
                  size: Sizes.size52,
                ),
              ),
              const Flexible(
                flex: 3,
                child: Column(
                  children: [
                    Gaps.v20,
                    Text(
                      "Mood tracker",
                      style: TextStyle(
                        fontSize: Sizes.size24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v10,
                    Opacity(
                      opacity: 0.65,
                      child: Text("Your very own mood tracker"),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    AccountButton(
                      isTextBlack: false,
                      text: 'Sign up',
                      onTap: _onSignupTap,
                    ),
                    Gaps.v10,
                    AccountButton(
                      isTextBlack: true,
                      text: 'Log in',
                      onTap: _onLoginTap,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
