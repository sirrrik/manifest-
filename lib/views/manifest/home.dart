import 'package:flutter/material.dart';
// global widget import
import '../global_widgets/bottom_nav.dart';
import '../home/home.dart';
import 'package:Manifest/views/phanero/home.dart';
import 'package:Manifest/views/manifest/home.dart';
import 'package:Manifest/views/more/home.dart';

// end

class Manifest_home extends StatefulWidget {
  const Manifest_home({Key? key}) : super(key: key);

  @override
  _Manifest_homeState createState() => _Manifest_homeState();
}

class _Manifest_homeState extends State<Manifest_home> {
  int selectedIndex = 0;

  List screens = [HomePage(), Manifest_home(), Phanero_Home(), More_home()];

  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phanero '),
      ),
      bottomNavigationBar: BottomMenu(
        selectedIndex: selectedIndex,
        onClicked: onClicked,
      ),
    );
  }
}
