import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:librarycom/gates/auth_state_changes_gate.dart';
import 'package:librarycom/ui/pages/homepage.dart';
import 'package:librarycom/ui/pages/user_authentication/login_page.dart';
import 'package:librarycom/ui/pages/user_authentication/register_page.dart';
import 'package:librarycom/firebase_options.dart';
import 'package:librarycom/ui/pages/user_authentication/reset_password.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(90, 0, 255, 1),
        ),
        textTheme: GoogleFonts.latoTextTheme(),
        scaffoldBackgroundColor: Colors.grey[200],
        useMaterial3: true,
      ),
      home: const AuthStateChangesGate(),
      routes: {
        "/home": (context) => const Homepage(),
        "/login": (context) => const LoginPage(),
        "/register": (context) => const RegisterPage(),
        "/reset-password": (context) => const ResetPassword(),
      },
    );
  }
}
