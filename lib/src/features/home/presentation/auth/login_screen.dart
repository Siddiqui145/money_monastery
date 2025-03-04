import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money_monastery/src/features/home/presentation/auth/reset_password_screen.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_button.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    Future<void> loginWithEmailAndPassword() async {
      try{
        final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(), 
          password: passwordController.text.trim());
          print(userCredential);
      } on FirebaseAuthException
      catch(e) {
        print(e.message);
      }
    }

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      body: Padding(padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 35,),
            Text("You're one step closer to Financial Nirvana!",
            style: Theme.of(context).textTheme.titleMedium,),

            const SizedBox(height: 20,),
            CustomTextfield(title: 'Email ID', controller: emailController),
        
            const SizedBox(height: 20,),
            CustomTextfield(title: 'Password', controller: passwordController),
            
            const SizedBox(height: 45,),
              CustomButton(title: 'Login', onPressed: () async {
                await loginWithEmailAndPassword();
                //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              }),
            
             const SizedBox(height: 20,),
             CustomButton(title: 'Reset Password', onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPasswordScreen()));
              },
              backgroundColor: Colors.black,
              textColor: Colors.white,),
              
          ],
        ),
      ),),
    );
  }
}