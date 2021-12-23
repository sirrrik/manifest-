import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Manifest/views/auth/signup.dart';
import 'package:Manifest/views/home/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late String _email, _password;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        // print(user);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
    @override
    void initState() {
      super.initState();
      this.checkAuthentication();
    }
  }

  login() async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();

      try {
        await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);
      } catch (e) {
        showError(e.toString());
      }
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  navigateToSignup() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 400,
                child: Image.asset(
                  'assets/images/manifeststart.jpeg',
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 22.0, top: 8, right: 22),
                        child: Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email)),
                            validator: (input) {
                              if (input!.isEmpty) {
                                return 'Enter Email';
                              }
                            },
                            onSaved: (input) => _email = input!,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 22.0, top: 8, right: 22),
                        child: Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.lock)),
                            validator: (input) {
                              if (input!.length < 6) {
                                return 'Provide Minimum 6 Character';
                              }
                            },
                            obscureText: true,
                            onSaved: (input) => _password = input!,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 35.0,
              ),
              Container(
                width: 220,
                height: 50,
                child: ElevatedButton(
                  onPressed: login,
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
                      primary: Colors.orange,
                      padding: EdgeInsets.fromLTRB(70, 10, 70, 10)),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                child: Text('Create an Account'),
                onTap: navigateToSignup,
              ),
              SizedBox(
                height: 20.0,
              ),
              // SignInButton(
              //   Buttons.Google,
              //   text: "Sign up with Google",
              //   onPressed: () {},
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
