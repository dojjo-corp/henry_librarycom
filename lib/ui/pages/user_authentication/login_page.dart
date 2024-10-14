import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:librarycom/services/firebase/auth.dart';
import 'package:librarycom/ui/components/my_button.dart';
import 'package:librarycom/ui/components/simple_textfield.dart';
import 'package:librarycom/utils/global_methods.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final _key = GlobalKey<FormState>();

  void _login() async {
    log("email: ${emailController.text}");
    log("pass: ${passwordController.text}");
    if (_key.currentState!.validate()) {
      _key.currentState!.save();

      try {
        final auth = Authentication();
        await auth.login(emailController.text.trim(), passwordController.text);
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            "/home",
            (route) => false,
          );
        }
      } catch (e) {
        if (mounted) {
          showSnackBar(context, "Error logging in: ${e.toString()}");
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 25),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.9,
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Image.asset(
                            "assets/icons/community.png",
                            height: 100,
                            width: 100,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Welcome back",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SimpleTextfield(
                          hintText: "Email",
                          controller: emailController,
                        ),
                        const SizedBox(height: 5),
                        SimpleTextfield(
                          hintText: "Password",
                          controller: passwordController,
                          obscureText: true,
                        ),
                        const SizedBox(height: 15),
                        // todo: forgot password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  "/reset-password",
                                );
                              },
                              child: Text(
                                "reset password",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        MyButton(onPressed: _login, btnText: "login"),
                      ],
                    ),

                    // todo: GOTO REGISTER INSTEAD
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, "/register"),
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
