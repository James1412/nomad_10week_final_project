import 'package:final_project/constants/gaps.dart';
import 'package:final_project/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const String routeUrl = '/login';
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => SignupScreenState();
}

class SignupScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  bool _isObsecure = false;

  String? _emailValidator(String? value) {
    final regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (value != null) {
      if (!regExp.hasMatch(value)) {
        return "Email not valid";
      }
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value != null) {
      if (value.length < 8) {
        return "Password must be longer than 8 characters";
      }
    }
    return null;
  }

  void _onContinueTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
      }
    }
  }

  void _onPasswordEyeTap() {
    setState(() {
      _isObsecure = !_isObsecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Gaps.v64,
                TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => _emailValidator(value),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(Sizes.size10),
                    ),
                    hintText: "Email",
                  ),
                  onSaved: (newValue) {
                    if (newValue != null) {
                      _formData['email'] = newValue.toString();
                    }
                  },
                ),
                Gaps.v20,
                TextFormField(
                  obscureText: _isObsecure ? false : true,
                  cursorColor: Colors.black,
                  validator: (value) => _passwordValidator(value),
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: _onPasswordEyeTap,
                      child: Icon(
                        _isObsecure
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(Sizes.size10),
                    ),
                    hintText: "Password",
                  ),
                  onSaved: (newValue) {
                    if (newValue != null) {
                      _formData['password'] = newValue.toString();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: BottomAppBar(
          elevation: 0,
          child: GestureDetector(
            onTap: _onContinueTap,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(Sizes.size32),
                color: Colors.black,
              ),
              child: const Center(
                child: Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
