import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.title,
    required this.controller,
    this.hintText,
    this.obscureText = false
    });

    final String title;
    final TextEditingController controller;
    final String? hintText;
    final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: title,
          hintStyle: Theme.of(context).textTheme.titleMedium,
          filled: true,
          //enabledBorder: OutlineInputBorder(),
          fillColor: Color.fromRGBO(204, 196, 196, 1),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none, // No border
            ),
        ),
      ),
    );
  }
}