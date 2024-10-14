import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:librarycom/ui/pages/homepage.dart';
import 'package:librarycom/ui/pages/user_authentication/login_page.dart';

class AuthStateChangesGate extends StatefulWidget {
  const AuthStateChangesGate({super.key});

  @override
  State<AuthStateChangesGate> createState() => _AuthStateChangesGateState();
}

class _AuthStateChangesGateState extends State<AuthStateChangesGate> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Homepage();
        }
        return const LoginPage();
      },
    );
  }
}
