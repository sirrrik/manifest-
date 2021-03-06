import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:Manifest/views/theme/theme.dart';
import '../global_widgets/app_bar.dart';
import './qr_code.dart';
import '../home/start.dart';
// global widget import
import '../global_widgets/bottom_nav.dart';
import 'package:Manifest/views/phanero/home.dart';
import 'package:Manifest/views/manifest/home.dart';
import 'package:Manifest/views/more/home.dart';

// end

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StartPage()));
      }
    });
  }

  getUser() async {
    User? firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser!;
        this.isloggedin = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();

    // final googleSignIn = GoogleSignIn();
    // await googleSignIn.signOut();
  }

  @override
  void initState() {
    this.checkAuthentification();
    this.getUser();
  }

  final List<String> imageList = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEwzz_J4yJzx_EgpEKmiYtGDh4CDib6z4XNw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHSbjfpWvKeo3OP0ZQimu-lkh7hif2UIG06Q&usqp=CAU"
  ];

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
      backgroundColor: ManifestAppTheme.white,
      drawer: Drawer(
        child: SafeArea(
            child: Center(
          child: ElevatedButton(
            child: Text('Logout'),
            onPressed: signOut,
          ),
        )),
      ),
      appBar: ManifestAppBar(),

      // work on bottom appbar
      bottomNavigationBar: BottomMenu(
        selectedIndex: selectedIndex,
        onClicked: onClicked,
      ),

      body: SingleChildScrollView(
        child: Column(
      //  screens.elementAt(selectedIndex),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Hello, ${user.displayName} ',
                  style: TextStyle(
                    color: ManifestAppTheme.darkText,
                    fontWeight: FontWeight.w300,
                    fontSize: 28.0,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: SizedBox(
                      width: 200,
                      child: Column(
                        children: [
                          Text(
                            'Manifest, Makindye.',
                            style: TextStyle(
                                color: ManifestAppTheme.strongButton,
                                fontSize: 30,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Phaneroo is a dynamic, life transforming and',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w300),
                          ),
                          Text(
                            'generational impacting ministry with a vision to transform nations and the entire world with the word of God.',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: 130,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14.0),
                            child: Image.asset(
                              'assets/images/p.jpeg',
                              width: 95,
                              height: 250,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffFDFAFA),
                  boxShadow: [
                    BoxShadow(color: Colors.white70, spreadRadius: 3),
                  ],
                ),
                height: 300,
              ),
            ),

            // image banners

            SizedBox(
              height: 180,
              child: CarouselSlider(
                options: CarouselOptions(
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    autoPlay: true),
                items: [
                  ...imageList
                      .map((e) => ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                Image.network(
                                  e,
                                  // width: 20,
                                  // height: 15,
                                  fit: BoxFit.cover,
                                )
                              ],
                            ),
                          ))
                      .toList(),
                ],
              ),
            ),
            // slider

            Builder(builder: (context) {
              decoration:
              BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white70,
                    spreadRadius: 0.0,
                  ),
                ],
              );
              final GlobalKey<SlideActionState> _Key = GlobalKey();
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: SlideAction(
                    text: 'Slide to QR Code',
                    textStyle: ManifestAppTheme.btText,
                    alignment: Alignment.bottomCenter,
                    innerColor: ManifestAppTheme.lightButton,
                    outerColor: ManifestAppTheme.strongButton,
                    sliderButtonIcon: Icon(
                      Icons.arrow_forward,
                      color: ManifestAppTheme.white,
                    ),
                    submittedIcon: Icon(Icons.done),
                    animationDuration: Duration(seconds: 1),
                    key: _Key,
                    onSubmit: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => qr_code()),
                      );
                      Future.delayed(Duration(milliseconds: 300),
                          () => _Key.currentState!.reset());
                    }),
              );
            }),
            SizedBox(
              height: 4,
            ),
            // devotion

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 250, 0),
              child: Text(
                'Devotion',
                style: TextStyle(
                  fontFamily: ManifestAppTheme.fontName,
                  fontSize: 24,
                  letterSpacing: 0.27,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            // placeholder for image
            ClipRRect(
              borderRadius: BorderRadius.circular(14.0),
              child: Image.asset(
                'assets/images/devotion.jpeg',
                width: 380,
                height: 200,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 8,
            ),

            // read devotion button
            SizedBox(
              width: 380,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Click to read devotion',
                    style: TextStyle(
                      fontFamily: ManifestAppTheme.fontName,
                      color: ManifestAppTheme.darkText,
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      letterSpacing: 0.18,
                    ),
                  )),
            ),
            SizedBox(
              height: 4,
            ),
            // phaneroo sermons

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0)),
                    child: Image.asset(
                      'assets/images/devotion.jpeg',
                      width: 80,
                      height: 80,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 295,
                    height: 80,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)),
                          color: Colors.blue[100]),
                      child: Center(
                        child: Text(
                          'The faith series',
                          style: TextStyle(
                            fontFamily: ManifestAppTheme.fontName,
                            color: ManifestAppTheme.darkText,
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            letterSpacing: 0.18,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),

            // seccond
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0)),
                    child: Image.asset(
                      'assets/images/devotion.jpeg',
                      width: 80,
                      height: 80,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 295,
                    height: 80,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)),
                          color: Colors.blue[100]),
                      child: Center(
                        child: Text(
                          'Money',
                          style: TextStyle(
                            fontFamily: ManifestAppTheme.fontName,
                            color: ManifestAppTheme.darkText,
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            letterSpacing: 0.18,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            // third
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0)),
                    child: Image.asset(
                      'assets/images/devotion.jpeg',
                      width: 80,
                      height: 80,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 295,
                    height: 80,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)),
                          color: Colors.blue[100]),
                      child: Center(
                        child: Text(
                          'Submition',
                          style: TextStyle(
                            fontFamily: ManifestAppTheme.fontName,
                            color: ManifestAppTheme.darkText,
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                            letterSpacing: 0.18,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
    );
  }
}
