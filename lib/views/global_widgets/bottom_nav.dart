import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  final selectedIndex;
  ValueChanged<int> onClicked;
  BottomMenu({this.selectedIndex, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      
      items: [
       
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.call_outlined),
          label: 'Manifest',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Phanero',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more),
          label: 'More',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onClicked,
      selectedItemColor: Colors.red[800],
      backgroundColor: Colors.black,
      unselectedItemColor: Color.fromARGB(255, 55, 143, 44),
    );
  }
}
