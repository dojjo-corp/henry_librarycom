import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SimpleTextfield extends StatefulWidget {
  SimpleTextfield({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
  });
  bool obscureText;
  final String hintText;
  final TextEditingController controller;

  @override
  State<SimpleTextfield> createState() => _SimpleTextfieldState();
}

class _SimpleTextfieldState extends State<SimpleTextfield> {
  bool _isObscured = false;
  @override
  Widget build(BuildContext context) {
    bool isPassword = widget.obscureText;

    return TextFormField(
      controller: widget.controller,
      obscureText: _isObscured,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[50]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[50]!),
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        labelText: widget.hintText,
        suffixIcon: isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
                child: _isObscured
                    ? const Icon(Icons.visibility_rounded)
                    : const Icon(Icons.visibility_off_rounded),
              )
            : null,
      ),
    );
  }
}
