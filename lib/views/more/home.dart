import 'package:flutter/material.dart';
// global widget import
import '../global_widgets/bottom_nav.dart';
import '../home/home.dart';
import 'package:test_2/views/phanero/home.dart';
import 'package:test_2/views/manifest/home.dart';
import 'package:test_2/views/more/home.dart';

// end
class More_home extends StatefulWidget {
  const More_home({Key? key}) : super(key: key);

  @override
  _More_homeState createState() => _More_homeState();
}

class _More_homeState extends State<More_home> {
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
