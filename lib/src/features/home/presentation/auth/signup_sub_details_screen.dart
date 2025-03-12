import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:money_monastery/src/features/home/data/network/router/app_router.gr.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_button.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_textfield.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/drop_down.dart';

@RoutePage()
class SignupSubDetailsScreen extends StatefulWidget {
  const SignupSubDetailsScreen({
    super.key,
    required this.email,
    required this.name,
    required this.mobile,
    required this.dob
    });

  final String email;
  final String name;
  final String mobile;
  final String dob;

  @override
  State<SignupSubDetailsScreen> createState() => _SignupSubDetailsScreenState();
}

class _SignupSubDetailsScreenState extends State<SignupSubDetailsScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController genderController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController incomeController = TextEditingController();

   Future<void> uploadUserToDb() async {
      try {
        await FirebaseFirestore.instance.collection("users").add({
          "email": widget.email,
          "name": widget.name,
          "mobile": widget.mobile,
          "dob": widget.dob,
          "gender": genderController.text.trim(),
          "city": cityController.text.trim(),
          "income": incomeController.text.trim(),
        });

        if (!mounted) return;
        context.router.replaceAll([const HomeRoute()]);
        // context.router.pushAndPopUntil(
        //   const HomeRoute(),
        //   predicate: (route) => false
        //   );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User Data Uploaded Successfully!"),
          backgroundColor: Colors.green,),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error Uploading data: $e"),
          backgroundColor: Colors.red,),
        );
      
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 105, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                    "You're one step closer to Financial Nirvana!",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                const SizedBox(height: 20,),
                                //CustomTextfield(title: 'Gender', controller: genderController),
                                Dropdown(title: "Select Gender", items: ["Male", "Female", "Other"], controller: genderController),
                            
                                const SizedBox(height: 20,),
                                CustomTextfield(
                                  title: 'Current City of Residence',
                                  controller: cityController, keyboardType: TextInputType.name,

                                // validator: (value) {
                                //   if (value == null || value.trim().isEmpty) {
                                //     return "City cannot be Empty";
                                //   }
                                //   return null;
                                // },
                                ),
                            
                                const SizedBox(height: 20,),
                                CustomTextfield(title: 'Annual Income', controller: incomeController, keyboardType: TextInputType.number,
                                // validator: (value) {
                                //   if (value == null || value.trim().isEmpty) {
                                //     return "Income cannot be Empty";
                                //   }
                                //   return null;
                                // },
                                ),
                                const SizedBox(height: 20,),
                    
                                CustomButton(
                      title: 'Next', 
                      textColor: Colors.white,
                      backgroundColor: Colors.green,
                      width: 120,
                      onPressed: () {
                        uploadUserToDb();
                      }
                                  )
                            
              ],
            ),
          ),
        ),
      ),
    );
  }
}