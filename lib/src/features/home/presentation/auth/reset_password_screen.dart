import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money_monastery/src/features/home/data/network/router/app_router.gr.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_button.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_textfield.dart';

@RoutePage()
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final TextEditingController resetemailController = TextEditingController();

    Future<void> sendPasswordResetLink() async {
      String email = resetemailController.text.trim();

      if(email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email cannot be Empty'), backgroundColor: Colors.red,));
      }
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        
        if (!mounted) return;

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password Reset Link sent Successfully")));
        context.router.replace(const LandingRoute());
      
      }
      on FirebaseAuthException catch(e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      body: Center(
        child: Padding(padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Can't remmember your password? \n Reset it with your Regsitered Email!",
              style: Theme.of(context).textTheme.titleMedium,),
          
              const SizedBox(height: 45,),
              CustomTextfield(title: 'Enter Email ID', controller: resetemailController),
          
              const SizedBox(height: 45,),
              
               const SizedBox(height: 20,),
               CustomButton(title: 'Send Email', onPressed: () {
                  sendPasswordResetLink();
                },
                backgroundColor: Colors.black,
                textColor: Colors.white,
                ),
                
            ],
          ),
        ),),
      ),
    );
  }
}