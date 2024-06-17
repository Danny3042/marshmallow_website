import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
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
      body: const SingleChildScrollView( // Use SingleChildScrollView to enable scrolling when the content is too long to fit on the screen
        padding: EdgeInsets.all(16.0), // Add some padding around the text
        child: Text(
          'Information We Collect Through Health Connect\n\n'
              'With your permission, the App may access certain health data from Health Connect. The specific data types we access will depend on the features you choose to use. Examples of data we may access include:\n'
              'Steps\n'
              'Distance\n'
              'Activity type\n'
              'Heart rate\n'
              'Sleep data\n'
              'Weight\n\n'
              'How We Use Your Health Connect Data\n\n'
              'We will only use your Health Connect data for the purposes described in this privacy policy and in accordance with your permissions. We may use your data to:\n'
              'Provide you with the features and functionality of the App\n'
              'Improve the accuracy of the App\'s algorithms\n'
              'Personalise your experience with the App\n'
              'Help you track your health and fitness goals\n\n'
              'We will not:\n'
              'Sell your health data to any third party\n'
              'Use your health data for advertising purposes\n'
              'Share your health data with third parties without your permission\n\n'
              'Your Control Over Your Health Data\n\n'
              'You have complete control over the data you share with the App through Health Connect. You can:\n'
              'Review the data types the App requests access to\n'
              'Grant or deny permission to access your data\n'
              'Revoke access to your data at any time\n'
              'Delete your data from the App\n\n'
              'Security of Your Health Data\n\n'
              'We take the security of your health data very seriously. We use industry-standard security practices provided by Google’s services to protect your data from unauthorised access, disclosure, alteration, or destruction. Health Connect data is stored on your device and encrypted.\n\n'
              'Changes to this Privacy Policy\n\n'
              'We may update this privacy policy from time to time. We will notify you of any changes by posting the new privacy policy on the App.\n\n'
              'Contact Us\n\n'
              'If you have any questions about this privacy policy, please contact us at danielramzani@gmail.com',
          style: TextStyle(fontSize: 16), // Set the font size
        ),
      ),
    );
  }
}