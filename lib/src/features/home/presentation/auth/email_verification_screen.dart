import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money_monastery/src/features/home/presentation/auth/login_screen.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}


  

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
   FirebaseAuth.instance.currentUser?.sendEmailVerification();

    timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      if (FirebaseAuth.instance.currentUser?.emailVerified ?? false) {
        timer.cancel(); 

        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()), 
          );
        }
      }
    });
  }

  Future<void> sendEmailVerificationLink() async {
    try {
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Verification email sent!")),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? "Error sending verification email")),
        );
      }
    }
  }

  @override
  void dispose() {
    timer.cancel(); 
    super.dispose();
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verify Your Email")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("A verification email has been sent to your email."),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: sendEmailVerificationLink,
              child: const Text("Resend Verification Email"),
            ),
          ],
        ),
      ),
    );
  }
}