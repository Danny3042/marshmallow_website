import 'package:flutter/material.dart';

class FlutterInfo extends StatelessWidget {
  const FlutterInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter'),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Image.network(
                'https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/events/flutter-2038877-1720090_cFkrLwb.png',
                height: 100, // You can adjust the size as needed
              ),
              const ListTile(
                leading: Icon(Icons.developer_mode),
                title: Text(
                  'Open-source UI software development kit',
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text(
                  'Flutter is an open-source UI software development kit created by Google. '
                      'It is used to develop applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia, and the web from a single codebase.',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              // Add more ListTile widgets for more information about Flutter
            ],
          ),
        ),
      ),
    );
  }
}