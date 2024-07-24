import 'package:flutter/material.dart';

class SupportInfo extends StatelessWidget {
  final List<FAQ> faqs = [
    FAQ(question: "What is HealthCompose?",
        answer: "HealthCompose is a health and fitness app to help you maintain a healthy lifestyle by setting goals, completing tasks, and view health data in one place using Apple Health and Google Health Connect"),
    FAQ(question: "Is HealthCompose free?",
        answer: "HealthCompose is free for people. There are no hidden fees or missing features. There are no ads, and we do not collect or sell personal data."),
    // Add more FAQs here
    FAQ(question: "Can I delete all my data within my account?",
        answer: "Yes, you control your data within HealthCompose. Within the app, go to Profile and at the bottom you will see the option to “Delete Account,” which will delete all of your data."),
    FAQ(question: "Why should I use CommonHealth? ",
        answer: "HealthCompose offers users a number of key benefits:"
            "Access your information where you need it, when you need it: With CommonHealth, your health information is right at your fingertips -- take it with you wherever you go and share it with those you trust.  "
            "Engage with all of your health information in one place: Get a holistic view of your health information by importing data from health apps. ")
  ];

  SupportInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Frequently Asked Questions',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: faqs.length,
            itemBuilder: (context, index) {
              return ExpansionTile(
                title: Text(faqs[index].question),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(faqs[index].answer),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
class FAQ {
  final String question;
  final String answer;

  FAQ({required this.question, required this.answer});
}