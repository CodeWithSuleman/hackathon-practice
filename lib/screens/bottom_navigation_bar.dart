import 'package:flutter/material.dart';
import 'package:project4/screens/home_screen.dart';
import 'package:project4/screens/login_screen.dart';
import 'constants/constants_colors.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});
  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _selectedItem = 0;
  static const List<Widget> mylist = [HomeScreen()];
  void _onTapitem(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mylist[_selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'Business'),
        ],
        currentIndex: _selectedItem,
        selectedItemColor: Colors.amber[800],
        onTap: _onTapitem,
      ),
    );
  }
}
