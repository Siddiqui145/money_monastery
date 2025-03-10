//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:money_monastery/src/features/home/data/network/router/app_router.dart';
//import 'package:money_monastery/src/features/home/presentation/screens/qnda_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  //const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      //home: 
      // FirebaseAuth.instance.currentUser!= null 
      // ? const QndaScreen() 
      // : const LandingScreen(),
      //const LandingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}