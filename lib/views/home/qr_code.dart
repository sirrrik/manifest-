import 'package:flutter/material.dart';
// global widget import
import '../global_widgets/bottom_nav.dart';
import '../home/home.dart';
import 'package:test_2/views/phanero/home.dart';
import 'package:test_2/views/manifest/home.dart';
import 'package:test_2/views/more/home.dart';

// end

class qr_code extends StatefulWidget {
  const qr_code({Key? key}) : super(key: key);

  @override
  _qr_codeState createState() => _qr_codeState();
}

// ignore: camel_case_types
class _qr_codeState extends State<qr_code> {
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
        title: Text('Qr Code'),
      ),
      //bottom nav
      bottomNavigationBar: BottomMenu(
        selectedIndex: selectedIndex,
        onClicked: onClicked,
      ),
    );
  }
}
