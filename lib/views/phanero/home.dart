import 'package:flutter/material.dart';
// global widget import
import '../global_widgets/bottom_nav.dart';
import '../home/home.dart';
import 'package:Manifest/views/phanero/home.dart';
import 'package:Manifest/views/manifest/home.dart';
import 'package:Manifest/views/more/home.dart';

// end

class Phanero_Home extends StatefulWidget {
  const Phanero_Home({Key? key}) : super(key: key);

  @override
  _Phanero_HomeState createState() => _Phanero_HomeState();
}

class _Phanero_HomeState extends State<Phanero_Home> {
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
