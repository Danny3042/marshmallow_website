import 'package:flutter/material.dart';

class MaterialDesignInfo extends StatelessWidget {
  const MaterialDesignInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Material Design'),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Image.network(
                'https://assets-global.website-files.com/6198a2e43048192ebafec2cc/6240d37518341a633f0c8bce_61fb89a3bba2236e43633d2d_ucVTUoPg_400x400-removebg-preview.png',
                height: 100, // You can adjust the size as needed
              ),
              const ListTile(
                leading: Icon(Icons.design_services),
                title: Text(
                  'Material is the metaphor',
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text(
                  'Material Design is inspired by the physical world',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.graphic_eq),
                title: Text(
                  'Bold, graphic, intentional',
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text(
                  'Material Design is guided by print design methods such as typography, colour, and imagery',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.motion_photos_on),
                title: Text(
                  'Motion provides meaning',
                  style: TextStyle(fontSize: 16),
                ),
                subtitle: Text(
                  'Motion focuses attention and maintains continuity through subtle feedback',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}