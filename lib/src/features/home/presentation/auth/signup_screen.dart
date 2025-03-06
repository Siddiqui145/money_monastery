import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_monastery/src/features/home/presentation/auth/email_verification_screen.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_button.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_textfield.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/drop_down.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/widgets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

    final TextEditingController nameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController mobileController = TextEditingController();
    final TextEditingController dobController = TextEditingController();
    final TextEditingController genderController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController incomeController = TextEditingController();

    @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    mobileController.dispose();
    dobController.dispose();
    genderController.dispose();
    cityController.dispose();
    incomeController.dispose();
    super.dispose();
  }

  Future<void> createUserWithEmailAndPassword() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Email and Password cannot be empty!")),
      );
      return;
    }
    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password must be at least 6 characters!")),
      );
      return;
    }
    
        try {
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,);

      if (context.mounted){
      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => EmailVerificationScreen()),
      );
      }
    }
     on FirebaseAuthException catch(e) {
      if(context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.message}")),
      );
      }
      }
      catch(e) {
        //print("Unexpected Error : $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Unexpected Error occured'))
        );
      }
        }

        Future<void> uploadUserToDb() async {
          if(_formKey.currentState!.validate()) {
              try{
            await FirebaseFirestore.instance.collection("users").add({
              "name": nameController.text.trim(),
              "email": emailController.text.trim(),
              "mobile": mobileController.text.trim(),
              "dob": dobController.text.trim(),
              "gender": genderController.text.trim(),
              "city": cityController.text.trim(),
              "income": incomeController.text.trim()
            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Data Uploaded Successfully!")));
          }
          catch(e){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error Uploading data : $e")));
          }
        }
        }
        

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 35,),
              Text("You're one step closer to Financial Nirvana!",
              style: Theme.of(context).textTheme.titleMedium,),

              const SizedBox(height: 20,),
              CustomTextfield(title: 'Name', controller: nameController, keyboardType: TextInputType.name,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Name cannot be Empty";
                }
                return null;
              },),
          
              const SizedBox(height: 20,),
              CustomTextfield(title: 'Password', controller: passwordController, isPassword: true,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Password cannot be Empty";
                }
                return null;
              },
              ),
          
              const SizedBox(height: 20,),
              CustomTextfield(title: 'Email ID', controller: emailController, keyboardType: TextInputType.emailAddress,
              validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Email cannot be empty";
                  }
                  if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                      .hasMatch(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                },),
          
              const SizedBox(height: 20,),
              CustomTextfield(title: 'Mobile Number', controller: mobileController, keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
                FilteringTextInputFormatter.digitsOnly
              ],
              validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Mobile cannot be empty";
                  }
                  if (!RegExp(r"^[6789]\d{9}$").hasMatch(value)) {
                    return "Enter a valid 10-digit mobile number starting with 6, 7, 8, or 9";
                  }
                  if (value.length != 10) {
                    return "Enter a valid 10-digit mobile number";
                  }
                  return null;
                },),
          
              const SizedBox(height: 20,),
              CustomTextfield(title: 'Date of Birth (DD-MM-YYYY)', controller: dobController, keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Date of Birth cannot be Empty";
                }
                RegExp dobRegex = RegExp(r'^\d{2}-\d{2}-\d{4}$');
                if (!dobRegex.hasMatch(value)) {
                return "Enter valid format: DD-MM-YYYY";
                }
                return null;
              },
              inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(8),
              DateFormatter()
              ],),
          
              const SizedBox(height: 20,),
              //CustomTextfield(title: 'Gender', controller: genderController),
              Dropdown(title: "Select Gender", items: ["Male", "Female"], controller: genderController),
          
              const SizedBox(height: 20,),
              CustomTextfield(title: 'Current City of Residence', controller: cityController, keyboardType: TextInputType.name,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "City cannot be Empty";
                }
                return null;
              },),
          
              const SizedBox(height: 20,),
              CustomTextfield(title: 'Annual Income', controller: incomeController, keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Income cannot be Empty";
                }
                return null;
              },),
          
              const SizedBox(height: 20,),
              CustomButton(title: 'Sign Up', onPressed: () async {
                  await createUserWithEmailAndPassword();
                  await uploadUserToDb();
                },
                backgroundColor: Colors.black,
                textColor: Colors.white,),
                
            ],
          ),
        ),
      ),),
    );
  }
}