import 'package:flutter/material.dart';

class QndaScreen extends StatefulWidget {
  const QndaScreen({super.key});

  @override
  State<QndaScreen> createState() => _QndaScreenState();
}

class _QndaScreenState extends State<QndaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Q & A Screen'),
      ),
    );
  }
}