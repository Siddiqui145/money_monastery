import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}