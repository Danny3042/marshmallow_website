// HomeScreen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/privacy_policy.dart';
import '../navigation/navigation_rail.dart';
import '../Theme/Theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('My Projects'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        actions: const <Widget>[
          VerticalDivider(thickness: 1, width: 1),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Privacy Policy'),
              onTap: () {
                Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => PrivacyPolicy(),
                  transitionsBuilder: (context, animation1, animation2, child) {
                    return FadeTransition(opacity: animation1, child: child);
                  },
                ));
              },
            ),
            Consumer<ThemeNotifier>(
              builder: (context, themeNotifier, child) => ListTile(
                title: Text('Dark Mode'),
                trailing: Switch(
                  value: themeNotifier.isDarkMode,
                  onChanged: (value) {
                    themeNotifier.toggleTheme();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          CustomNavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });

              if (index == 1) {
                Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => PrivacyPolicy(),
                  transitionsBuilder: (context, animation1, animation2, child) {
                    return FadeTransition(opacity: animation1, child: child);
                  },
                ));
              }
            },
          ),
          Expanded(
            child: ThreeColumnLayout(),
          ),
        ],
      ),
    );
  }
}

class ThreeColumnLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          // If the screen width is greater than 600, use a three column layout
          return Row(
            children: <Widget>[
              Expanded(
                child: MaterialDesignInfo(),
              ),
              Expanded(
                child: FlutterInfo(),
              ),
              Expanded(
                child: TensorFlowInfo(),
              ),
            ],
          );
        } else {
          // If the screen width is less than or equal to 600, use a single column layout
          return ListView(
            children: <Widget>[
              MaterialDesignInfo(),
              FlutterInfo(),
              TensorFlowInfo(),
            ],
          );
        }
      },
    );
  }
}

class MaterialDesignInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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

class FlutterInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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

class TensorFlowInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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