import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 75, left: 16, right: 16, bottom: 12),
          child: Column(
            children: [
              Text(" At Money Monastery, we value your privacy. This policy explains how we collect, use, and protect your data. \n \n 1. Data We Collect We may collect: \n Personal Information: Name, email, profile details. \n Financial Interests (optional): For personalized recommendations. \n Usage Data: IP address, device info, browsing activity on our platform. Content Data: Questions, answers, comments you post. \n \n 2. How We Use Your Data We use data to: \n Provide and improve our services. \n Personalize content and recommendations. Ensure platform security and prevent fraud. Communicate with you (e.g., updates, notifications, promotions). \n \n 3. Data Sharing \n We don’t sell your data. However, we may share it with: \n Service providers (e.g., hosting, analytics). Legal authorities (if required by law). Third parties (only with user consent). \n \n 4. Cookies & Tracking \n We use cookies to: Analyze platform usage and improve performance. Remember user preferences for a smoother experience. You can disable cookies in your browser settings (may affect platform functionality).",
              style: Theme.of(context).textTheme.bodySmall,)
            ],
          ),
        ),
      ),
    );
  }
}