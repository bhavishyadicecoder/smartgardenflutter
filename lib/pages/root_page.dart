import 'package:flutter/material.dart';
import 'package:smart_garden/pages/dashboard.dart';
import 'package:smart_garden/pages/home.dart';
import 'package:smart_garden/pages/profile.dart';
import 'package:smart_garden/widgets/custom_bottom_bar.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0;

  // Define the different pages
  final List<Widget> _pages = [Home(), Profile(), Dashboard()];

  // Handle navigation item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Custom Bottom Navigation Bar'),
      // ),
      body: _pages[_selectedIndex], // Show the selected page
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped, // Handle item tap
      ),
    );
  }
}
