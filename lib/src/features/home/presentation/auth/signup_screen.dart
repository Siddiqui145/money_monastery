import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money_monastery/src/features/home/presentation/auth/landing_screen.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_button.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

  
    final TextEditingController nameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController mobileController = TextEditingController();
    final TextEditingController dobController = TextEditingController();
    final TextEditingController genderController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController incomeController = TextEditingController();

      Future<void> createUserWithEmailAndPassword() async {
    final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(), 
      password: passwordController.text.trim());
      print(userCredential);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    
  }
class _SignupScreenState extends State<SignupScreen> {
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
            CustomTextfield(title: 'Name', controller: nameController),
        
            const SizedBox(height: 20,),
            CustomTextfield(title: 'Password', controller: passwordController),
        
            const SizedBox(height: 20,),
            CustomTextfield(title: 'Email ID', controller: emailController),
        
            const SizedBox(height: 20,),
            CustomTextfield(title: 'Mobile Number', controller: mobileController),
        
            const SizedBox(height: 20,),
            CustomTextfield(title: 'Date of Birth (DD-MM-YYYY)', controller: dobController),
        
            const SizedBox(height: 20,),
            CustomTextfield(title: 'Gender', controller: genderController),
        
            const SizedBox(height: 20,),
            CustomTextfield(title: 'Current City of Residence', controller: cityController),
        
            const SizedBox(height: 20,),
            CustomTextfield(title: 'Annual Income', controller: incomeController),

            const SizedBox(height: 20,),
            CustomButton(title: 'Sign Up', onPressed: () async {
                await createUserWithEmailAndPassword();
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