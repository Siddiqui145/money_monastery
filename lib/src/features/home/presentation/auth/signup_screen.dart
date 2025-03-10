import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_monastery/src/features/home/presentation/auth/login_screen.dart';
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
  bool isEmailVerified = false;
  Timer? timer;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController incomeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    startEmailVerificationCheck();
  }

  void startEmailVerificationCheck() {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      if (FirebaseAuth.instance.currentUser?.emailVerified ?? false) {
        timer.cancel();
        setState(() {
          isEmailVerified = true;
        });

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email Verified Successfully')),
          );
        }
      }
    });
  }

  Future<void> sendEmailVerificationLink() async {
    String email = emailController.text.trim();
    if (email.isEmpty || !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid email before verifying!")),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: "TempPassword123@", // Temp password to register for verification
      );

      await FirebaseAuth.instance.currentUser?.sendEmailVerification();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Verification email sent! Please check your inbox.")),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Error sending verification email")),
      );
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email and Password cannot be empty!")),
      );
      return;
    }
    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password must be at least 6 characters!")),
      );
      return;
    }
    if (!isEmailVerified) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please verify your email before signing up')),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.currentUser?.updatePassword(password);
      await uploadUserToDb();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.message}")),
      );
    }
  }

  Future<void> uploadUserToDb() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseFirestore.instance.collection("users").add({
          "name": nameController.text.trim(),
          "email": emailController.text.trim(),
          "mobile": mobileController.text.trim(),
          "dob": dobController.text.trim(),
          "gender": genderController.text.trim(),
          "city": cityController.text.trim(),
          "income": incomeController.text.trim(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User Data Uploaded Successfully!")),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error Uploading data: $e")),
        );
      }
    }
  }

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
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 35),
                Text(
                  "You're one step closer to Financial Nirvana!",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 20),

                CustomTextfield(
                  title: 'Name',
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  validator: (value) => value!.trim().isEmpty ? "Name cannot be Empty" : null,
                ),
                const SizedBox(height: 20),

                CustomTextfield(
                  title: 'Password',
                  controller: passwordController,
                  isPassword: true,
                  validator: (value) => value!.length < 6 ? "Password must be at least 6 characters" : null,
                ),
                const SizedBox(height: 20),

                CustomTextfield(
                  title: 'Email ID',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.trim().isEmpty) return "Email cannot be empty";
                    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                CustomButton(
                  title: 'Verify Email',
                  textColor: Colors.white,
                  onPressed: sendEmailVerificationLink,
                  backgroundColor: Colors.black,
                  width: 140,
                  radius: 40,
                ),

                if (isEmailVerified)
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      "Email Verified! Now proceed.",
                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ),

                const SizedBox(height: 20),

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
          

                if (isEmailVerified)
                  CustomButton(
                    title: 'Sign Up',
                    onPressed: createUserWithEmailAndPassword,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
