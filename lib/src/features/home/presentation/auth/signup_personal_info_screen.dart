import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_monastery/src/features/home/data/network/router/app_router.gr.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_button.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_textfield.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/widgets.dart';

@RoutePage()
class SignupPersonalInfoScreen extends StatefulWidget {
  const SignupPersonalInfoScreen({
    super.key,
    required this.email,
    required this.password
    });

  final String email;
  final String password;

  @override
  State<SignupPersonalInfoScreen> createState() => _SignupPersonalInfoScreenState();
}

class _SignupPersonalInfoScreenState extends State<SignupPersonalInfoScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

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
                  const SizedBox(height: 20),
                  
                  CustomTextfield(
                  title: 'Name',
                                      controller: nameController,
                                      keyboardType: TextInputType.name,
                                      validator: (value) => value!.trim().isEmpty ? "Name cannot be Empty" : null,
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
              
                                  const SizedBox(height: 25,),
              
                                  CustomButton(
                      title: 'Next', 
                      textColor: Colors.white,
                      backgroundColor: Colors.green,
                      width: 120,
                      onPressed: () {
  if (formKey.currentState!.validate()) {
    context.router.push(SignupSubDetailsRoute(
      email: widget.email,
      name: nameController.text.trim(),
      mobile: mobileController.text.trim(),
      dob: dobController.text.trim(),
    ));
  }
},
                                  )

                ],
              ),
            ),
          ),
      ),
      
    );
  }
}