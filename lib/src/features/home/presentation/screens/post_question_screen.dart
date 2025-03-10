import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PostQuestionScreen extends StatefulWidget {
  const PostQuestionScreen({super.key});

  @override
  State<PostQuestionScreen> createState() => _PostQuestionScreenState();
}

class _PostQuestionScreenState extends State<PostQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}