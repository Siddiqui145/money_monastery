import 'package:flutter/material.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_button.dart';

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
              CustomButton(title: 'Sign up', onPressed: () {},
              backgroundColor: Colors.black,
              textColor: Colors.white,),
              const SizedBox(height: 15,),
              CustomButton(title: 'Login', onPressed: () {}),
              const SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}