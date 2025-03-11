import 'package:flutter/material.dart';

class CommentBox extends StatelessWidget {
  const CommentBox({super.key, required this.comments});

  final List<String> comments;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, 
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(), 
        child: Text(
          comments.join("\n"), 
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
      ),
    );
  }
}
