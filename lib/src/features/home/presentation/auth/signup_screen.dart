import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money_monastery/src/features/home/data/network/router/app_router.gr.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_button.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_textfield.dart';

@RoutePage()
class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: const ValueKey('SignupPage'));

  //This forces Flutter to recognize this page as a new instance on resume, preventing layout corruption.

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isEmailVerified = false;
  bool isLoading = false;
   late Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> sendVerificationEmail() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    if (!_formKey.currentState!.validate()) return;

    //setState(() => isLoading = true);

    try {
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Verification email sent! Check your inbox.")),
      );

      startEmailVerificationCheck();

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {

      if(!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Error sending email verification.")),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  void startEmailVerificationCheck() {
    timer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();

      if (FirebaseAuth.instance.currentUser?.emailVerified == true) {
        timer.cancel();
        setState(() => isEmailVerified = true);

        if(!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email Verified Successfully!')),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    sendVerificationEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "You're one step closer to Financial Nirvana!",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 20),
        
                  CustomTextfield(
                    title: 'Email ID',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) return "Email cannot be empty";
                      if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
        
                  CustomTextfield(
                    title: 'Password',
                    controller: passwordController,
                    isPassword: true,
                    validator: (value) =>
                        value != null && value.length < 6 ? "Password must be at least 6 characters" : null,
                  ),
                  const SizedBox(height: 20),
        
                  CustomButton(
                    title: 'Verify Email',
                    textColor: Colors.white,
                    onPressed: sendVerificationEmail,
                    width: 100,
                    backgroundColor: Colors.black,),
                  
        
                  
        
                  if (isEmailVerified)
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "Email Verified! Now proceed.",
                        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ),
        
                    const SizedBox(height: 20),
        
                    if (isEmailVerified)
                    CustomButton(
                      title: 'Next', 
                      textColor: Colors.white,
                      backgroundColor: Colors.green,
                      width: 120,
                      onPressed: () => context.router.push(SignupPersonalInfoRoute(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim()
                      ))),
        
                  const SizedBox(height: 20),
        
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
