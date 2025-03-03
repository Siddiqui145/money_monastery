import 'package:flutter/material.dart';
import 'package:money_monastery/src/features/home/presentation/auth/landing_screen.dart';
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

    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      body: Padding(padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 35,),
            Text("Can't remmember your password? \n Reset it with your Regsitered Email!",
            style: Theme.of(context).textTheme.titleMedium,),

            const SizedBox(height: 40,),
            CustomTextfield(title: 'Enter Email ID', controller: emailController),
        
            const SizedBox(height: 45,),
            
             const SizedBox(height: 20,),
             CustomButton(title: 'Send Email', onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LandingScreen()));
              },
              backgroundColor: Colors.black,
              textColor: Colors.white,),
              
          ],
        ),
      ),),
    );
  }
}