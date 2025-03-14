import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money_monastery/src/features/home/data/network/router/app_router.gr.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_button.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_textfield.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    Future<void> loginWithEmailAndPassword() async {
      try{
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(), 
          password: passwordController.text.trim());

          if (!mounted) return;
          
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Logged in Successfully!"),
          backgroundColor: Colors.green,));
          context.router.replaceAll([const HomeRoute()]);
      } on FirebaseAuthException
      catch(e) {
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
              //const SizedBox(height: 35,),
              Text("You're one step closer to Financial Nirvana!",
              style: Theme.of(context).textTheme.titleMedium,),
          
              const SizedBox(height: 20,),
              CustomTextfield(title: 'Email ID', controller: emailController),
          
              const SizedBox(height: 20,),
              CustomTextfield(title: 'Password', controller: passwordController, isPassword: true,),
              
              const SizedBox(height: 45,),
                CustomButton(title: 'Login',
                backgroundColor: Colors.green.shade500,
                textColor: Colors.white,
                 onPressed: () async {
                  await loginWithEmailAndPassword();
                }),
              
               const SizedBox(height: 20,),
               CustomButton(title: 'Reset Password', onPressed: () {
                  context.router.push(const ResetPasswordRoute());
                },
                backgroundColor: Colors.black,
                textColor: Colors.white,),
                
            ],
          ),
        ),),
      ),
    );
  }
}