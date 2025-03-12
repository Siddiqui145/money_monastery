import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:money_monastery/src/features/home/data/network/router/app_router.dart';
import 'package:money_monastery/src/features/home/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      theme: AppTheme.lightTheme,
      //home: 
      // FirebaseAuth.instance.currentUser!= null 
      // ? const QndaScreen() 
      // : const LandingScreen(),
      //const LandingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}