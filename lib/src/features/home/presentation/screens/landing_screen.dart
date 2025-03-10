import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:money_monastery/src/features/home/presentation/auth/login_screen.dart';
import 'package:money_monastery/src/features/home/presentation/auth/signup_screen.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_button.dart';

@RoutePage()
class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/money_monastery.png'),
                    const SizedBox(height: 10,),
                    Text('Your Gateway to Financial Nirvana!',
                    style: Theme.of(context).textTheme.titleSmall,),
                  ],
                ),
              ),
          
              //const Spacer(),
              CustomButton(title: 'Sign Up', onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
              },
              backgroundColor: Colors.black,
              textColor: Colors.white,),
              const SizedBox(height: 15,),
              CustomButton(title: 'Login', onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              }),
              const SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}