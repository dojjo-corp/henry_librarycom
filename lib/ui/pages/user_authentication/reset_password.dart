import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:librarycom/ui/components/back_button.dart';
import 'package:librarycom/ui/components/my_button.dart';
import 'package:librarycom/ui/components/simple_textfield.dart';
import 'package:librarycom/utils/global_methods.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late final TextEditingController emailController;
  final _key = GlobalKey<FormState>();
  bool _isLoading = false;

  void _sendResetEmail() async {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();

      setState(() {
        _isLoading = true;
      });

      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailController.text.trim(),
        );
        if (mounted) {
          showSnackBar(
            context,
            "Reset email sent to ${emailController.text}",
          );
        }
      } catch (e) {
        if (mounted) {
          showSnackBar(
            context,
            "Error sending reset email: ${e.toString()}",
          );
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _isLoading ? const LinearProgressIndicator() : null,
      appBar: AppBar(
        leading: const MyBackButton(),
        title: const Text("Password Reset"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                //   child: Text(
                //     "Enter a valid email address",
                //     style: const TextStyle(
                //       color: Colors.black87,
                //       fontWeight: FontWeight.bold,
                //       fontSize: 24,
                //     ),
                //   ),
                // ),

                Text(
                  "Enter a valid email",
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    // fontSize: 24,
                  ),
                ),
                const SizedBox(height: 20),
                Form(
                  child: SimpleTextfield(
                    controller: emailController,
                    hintText: "Reset email",
                  ),
                ),
                const SizedBox(height: 15),
                MyButton(
                  onPressed: _sendResetEmail,
                  btnText: "Send Reset Email",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
