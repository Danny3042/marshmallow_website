import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

@override
class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HealthCompose Privacy Policy'),
      ),
      body:  SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 16, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: 'Health Connect Data\n',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: '\na. Collection and Usage of Health Data:\n'
                    'We value the privacy and security of our users. Our mobile application requests access to health-related permissions, specifically the ability to read steps and sleep information. This data is collected for the sole purpose of enhancing the user experience and providing features related to health and fitness\n.'
                    '\nb. Purpose of Health Data Access:\n'
                    'Our app utilizes health-related permissions to track daily steps, and sleep patterns. This data is processed locally on the user\'s device and is not shared with any third parties.\n'
                    '\nc. User Consent\n:'
                    'By using our app, you explicitly consent to the collection and usage of health-related data for the purposes outlined in this privacy policy. You have the option to grant or deny these permissions within the app settings.\n'
                    '\nd. Security Measures\n:'
                    'We implement robust security measures to protect the confidentiality and integrity of health-related data. This includes encryption and secure storage.\n'
                    '\ne. Data Retention\n:'
                    'We retain health-related data only for as long as necessary to fulfill the purposes outlined in this privacy policy. Users can request the deletion of their data by deleting their account on the app\n'
                    '\nf. Third-Party Services:\n'
                    'Our app does not share health-related data with any third-party services, advertisers, or external entities. We do not engage in the sale or exchange of user data.\n',
              ),
            ],
          ),
        ),
      ),
    );
  }
}