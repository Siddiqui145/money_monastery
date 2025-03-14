import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money_monastery/src/features/home/data/network/router/app_router.gr.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_button.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> logoutUser() async {
    try {
      FirebaseAuth.instance.signOut();
      context.router.replaceAll([const LandingRoute()]);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Logged out successfully!"),
      backgroundColor: Colors.red,));
    }
    catch(e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final email = FirebaseAuth.instance.currentUser!.email;
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(
              height: 75,
            ),
            Text("Hello, $email",
            style: Theme.of(context).textTheme.titleMedium,),
            const SizedBox(
              height: 50,
            ),
            CustomButton(title: 'Terms & Conditions', onPressed: () {
              context.router.push(const TermsAndConditionsRoute());
            },
            backgroundColor: Colors.black, textColor: Colors.white,),
            const SizedBox(
              height: 30,
            ),
            CustomButton(title: 'Privacy Policy', onPressed: () {
              context.router.push(const PrivacyPolicyRoute());
            },
            backgroundColor: Colors.black, textColor: Colors.white,),
            const SizedBox(
              height: 30,
            ),
            CustomButton(title: 'Logout', onPressed: logoutUser,
            backgroundColor: Colors.red, textColor: Colors.white,),
          ],
        ),),
      ),
    );
  }
}