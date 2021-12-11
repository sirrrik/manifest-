import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../auth/login.dart';
import '../auth/signup.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  navigateToLogin() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  navigateToSignup() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              child: Image.asset(
                'assets/images/manifeststart.jpeg',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 45.0,
            ),
            RichText(
                text: TextSpan(
                    text: 'Manifest ',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: <TextSpan>[
                  TextSpan(
                      text: 'Fellowship',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange))
                ])),
            SizedBox(
              height: 10,
            ),
            Text(
              'welcome to make manifest',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 120,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: navigateToLogin,
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        primary: Colors.orange),
                  ),
                ),
                Container(
                  width: 120,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: navigateToSignup,
                    child: Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        primary: Colors.orange),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            SignInButton(
              Buttons.Google,
              text: "Sign up with Google",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
