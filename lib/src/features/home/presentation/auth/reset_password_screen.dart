import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money_monastery/src/features/home/presentation/screens/landing_screen.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_button.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_textfield.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {

    final TextEditingController resetemailController = TextEditingController();

    Future<void> sendPasswordResetLink() async {
      String email = resetemailController.text.trim();
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        
        if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password Reset Link sent Successfully")));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LandingScreen()));
      }
      }
      on FirebaseAuthException catch(e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }
    }

    return Scaffold(
      body: Padding(padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 35,),
            Text("Can't remmember your password? \n Reset it with your Regsitered Email!",
            style: Theme.of(context).textTheme.titleMedium,),

            const SizedBox(height: 40,),
            CustomTextfield(title: 'Enter Email ID', controller: resetemailController),
        
            const SizedBox(height: 45,),
            
             const SizedBox(height: 20,),
             CustomButton(title: 'Send Email', onPressed: () {
                sendPasswordResetLink();
                
              },
              backgroundColor: Colors.black,
              textColor: Colors.white,),
              
          ],
        ),
      ),),
    );
  }
}