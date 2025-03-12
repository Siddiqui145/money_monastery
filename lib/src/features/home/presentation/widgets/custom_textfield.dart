import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.title,
    required this.controller,
    this.hintText,
    this.obscureText = false,
    this.isPassword = false,
    this.keyboardType,
    this.validator, //For validation like regular experssions
    this.inputFormatters, //For Limiting number of digits in mobile numbers
    });

    final String title;
    final TextEditingController controller;
    final String? hintText;
    final bool obscureText;
    final bool isPassword;
    final TextInputType? keyboardType;
    final String? Function(String?)? validator;
    final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        validator: validator,
        inputFormatters: inputFormatters,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          hintText: title,
          hintStyle: Theme.of(context).textTheme.titleMedium,
          filled: true,
          //enabledBorder: OutlineInputBorder(),
          fillColor: Color.fromRGBO(204, 196, 196, 1),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none, 
            ),
        ),
      ),
    );
  }
}