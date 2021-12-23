import 'package:flutter/material.dart';

import '../theme/theme.dart';

class BottomMenu extends StatelessWidget {
  final selectedIndex;
  ValueChanged<int> onClicked;
  BottomMenu({this.selectedIndex, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          //  icon: SvgPicture.asset(IMAGE_ASSETS_ICONS_ORDER_HISTORY, ) ,
          //   activeIcon: SvgPicture.asset(IMAGE_ASSETS_ICONS_ORDER_HISTORY, color: Theme.of(context).accentColor ) ,
          //   label: 'Order History',
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
      backgroundColor: ManifestAppTheme.textBG,
      unselectedItemColor: ManifestAppTheme.darkText,
    );
  }
}
