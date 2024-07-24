import 'package:flutter/material.dart';

class TensorFlowInfo extends StatelessWidget {
  const TensorFlowInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TensorFlow'),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Tensorflow_logo.svg/1200px-Tensorflow_logo.svg.png',
                height: 100, // You can adjust the size as needed
              ),
              const ListTile(
                leading: Icon(Icons.analytics),
                title: Text(
                  'Free and open-source software library',
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text(
                  'TensorFlow is a free and open-source software library for machine learning and artificial intelligence. '
                      'It can be used across a range of tasks but has a particular focus on training and inference of deep neural networks.',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              // Add more ListTile widgets for more information about TensorFlow
            ],
          ),
        ),
      ),
    );
  }
}