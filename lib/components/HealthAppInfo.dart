import 'package:flutter/material.dart';

class HealthAppInfo extends StatelessWidget {
  const HealthAppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'HealthCompose',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'HealthCompose is designed to help you maintain a healthy lifestyle. '
                'Track your daily activities, monitor your health progress, and get personalised insights '
                'to achieve your fitness goals.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          Image.asset('assets/images/screenshot1.png'),
          const SizedBox(height: 10),
          Image.asset('assets/images/screenshot2.png'),
          // Add more Image.asset widgets for additional screenshots
        ],
      ),
    );
  }
}