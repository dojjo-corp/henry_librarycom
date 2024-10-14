import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.onPressed,
    required this.btnText,
  });

  final void Function()? onPressed;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: const Size(double.infinity, 45),
      ),
      onPressed: onPressed,
      child: Text(btnText),
    );
  }
}
