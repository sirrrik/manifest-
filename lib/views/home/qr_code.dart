import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:Manifest/views/theme/theme.dart';
// global widget import
import '../global_widgets/app_bar.dart';
import '../global_widgets/bottom_nav.dart';
import '../home/home.dart';
import 'package:Manifest/views/phanero/home.dart';
import 'package:Manifest/views/manifest/home.dart';
import 'package:Manifest/views/more/home.dart';

// end

class qr_code extends StatefulWidget {
  const qr_code({Key? key}) : super(key: key);

  @override
  _qr_codeState createState() => _qr_codeState();
}

// ignore: camel_case_types
class _qr_codeState extends State<qr_code> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  getUser() async {
    User? firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser!;
      });
    }
  }

  @override
  void initState() {
    this.getUser();
  }

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
      appBar: ManifestAppBar(),

      //bottom nav
      bottomNavigationBar: BottomMenu(
        selectedIndex: selectedIndex,
        onClicked: onClicked,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(34, 16, 16, 16),
              child: QrImage(
                data:
                    'User Name:, ${user.displayName} \n User Name:, ${user.email}  ',
                version: QrVersions.auto,
                size: 320,
                gapless: false,
              ),
            ),
            // info text
            SizedBox(
              height: 8,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: ManifestAppTheme.textBG,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.info,
                              color: ManifestAppTheme.darkText, size: 29),
                          onPressed: () {},
                        ),
                        Text(
                          'Info:',
                          style: TextStyle(
                            color: ManifestAppTheme.darkText,
                            fontWeight: FontWeight.normal,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'The QR Code above is a link to your information in our data bases the enables us to take your attandence in a contactless approach.',
                        style: TextStyle(
                          color: ManifestAppTheme.darkerText,
                          letterSpacing: 0.8,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
