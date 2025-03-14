import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 75, left: 16, right: 16, bottom: 12),
          child: Column(
            children: [
              Text(" Effective Date: [15-03-2025] \n \n 1. Introduction \n Welcome to Money Monastery! By using our platform, you agree to abide by the following terms and conditions. Please read them carefully before accessing or using our services. \n \n 2. Definitions \n Company refers to Money Monastery. \n User refers to anyone accessing the platform. \n Content refers to questions, answers, comments, and any other data shared by users. \n \n 3. User Eligibility \n To use Money Monastery, you must: \n Be at least 18 years old or have legal parental/guardian consent. \n Provide accurate, complete, and current information during registration. \n Not impersonate anyone or create accounts for unauthorized users. \n \n 4. User Responsibilities \n You agree to: \n Use the platform ethically and lawfully. Ensure any posted content is accurate and not misleading. \n Respect other users — no abusive, offensive, or harmful language. \n Prohibited Content includes: \n Spam or promotional content. \n Financial scams or misleading advice. \n Harmful, illegal, or discriminatory material. \n \n 5. Financial Advice Disclaimer \n Money Monastery is a community platform — not a licensed financial advisory service. \n Answers provided by users are opinions and not professional financial advice. Users must consult certified financial professionals before making financial decisions. \n \n 6. Content Ownership & License You retain ownership of the content you create. \n By posting on Money Monastery, you grant us a non-exclusive, royalty-free license to use, display, modify, and distribute your content for platform purposes (e.g., promoting helpful answers). \n \n 7. Moderation & Content Removal \n We reserve the right to moderate, edit, or remove content that violates these terms or harms our community — without prior notice.",
              style: Theme.of(context).textTheme.bodySmall,),
            ],
          ),
        ),
      ),
    );
  }
}