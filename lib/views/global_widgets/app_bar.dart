import 'package:flutter/material.dart';

import '../theme/theme.dart';

class ManifestAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100);
  const ManifestAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: ManifestAppTheme.white,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(250.0, 0, 0, 0),
            child: IconButton(
              icon: Icon(Icons.account_circle,
                  color: ManifestAppTheme.darkText, size: 29),
              onPressed: () {},
            ),
          ),
        ]),
      ),
    );
  }
}
