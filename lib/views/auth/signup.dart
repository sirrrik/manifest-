import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:test_2/views/home/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email, _password, _name;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  SignUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);

        if (user != null) {
          // UserUpdateInfo updateuser = UserUpdateInfo();
          // updateuser.displayName = _name;
          //  user.updateProfile(updateuser);
          await _auth.currentUser!.updateProfile(displayName: _name);
          // await Navigator.pushReplacementNamed(context,"/") ;

        }
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
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 22.0, top: 8, right: 22),
                        child: Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Name',
                                prefixIcon: Icon(Icons.person)),
                            validator: (input) {
                              if (input!.isEmpty) {
                                return 'Enter Name';
                              }
                            },
                            onSaved: (input) => _name = input!,
                          ),
                        ),
                      ),
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
                  onPressed: SignUp,
                  child: Text(
                    'Signup',
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
                height: 14.0,
              ),
              SignInButton(
                Buttons.Google,
                text: "Sign up with Google",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
