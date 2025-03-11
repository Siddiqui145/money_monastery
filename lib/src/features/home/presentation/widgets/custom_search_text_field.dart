import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String>? onChanged;

  const CustomSearchTextField({
    super.key,
    required this.controller,
    this.hintText = "Type Here...",
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35, 
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        textAlign: TextAlign.center, 
        style: const TextStyle(fontSize: 14), 
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.grey.shade300, 
          contentPadding: EdgeInsets.zero, 
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20), 
            borderSide: BorderSide(width: 0.5), 
          ),
        ),
      ),
    );
  }
}
