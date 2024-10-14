import 'package:flutter/material.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: SizedBox(
        height: 30,
        width: 30,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
    );
  }
}
