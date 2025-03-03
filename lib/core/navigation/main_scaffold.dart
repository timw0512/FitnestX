import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '/features/home/presentation/pages/home_page.dart';
import '/features/profile/presentation/pages/profile_page.dart';
import '/features/settings/presentation/pages/settings_page.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {

  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    ProfilePage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ('home').tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: ('profile').tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: ('settings').tr(),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}