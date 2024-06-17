// HomeScreen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/FlutterInfo.dart';
import '../components/MaterialDesignInfo.dart';
import '../components/TensorFlowInfo.dart';
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
  final ValueNotifier<bool> isDrawerOpenNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('My Projects'),
        leading: Builder(
          builder: (context) => ValueListenableBuilder<bool>(
            valueListenable: isDrawerOpenNotifier,
            builder: (context, isDrawerOpen, child) => IconButton(
              icon: Icon(isDrawerOpen ? Icons.menu_open : Icons.menu),
            onPressed: () {
              if (isDrawerOpen) {
                Navigator.of(context).pop();
                isDrawerOpenNotifier.value = false;
              } else {
                scaffoldKey.currentState!.openDrawer();
                isDrawerOpenNotifier.value = true;
              }
            },
          ),
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
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
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
                leading: Icon(themeNotifier.isDarkMode ? Icons.dark_mode : Icons.light_mode),
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


