import 'package:flutter/material.dart';
import 'package:librarycom/ui/pages/homepage.dart';
import 'package:librarycom/ui/pages/user_authentication/login_page.dart';
import 'package:librarycom/ui/pages/user_authentication/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0x00302b63),
        ),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const Homepage(),
        "/login": (context) => const LoginPage(),
        "/register": (context) => const RegisterPage(),
      },
    );
  }
}
