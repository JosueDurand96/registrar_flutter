
import 'package:flutter/material.dart';
import 'package:flutter_app/adddata.dart';
import 'package:flutter_app/login/login_validate.dart';
import 'package:flutter_app/login/user_controller.dart';
//import 'dart:async';
//import 'dart:convert' show json;
//import 'dart:convert';
//import 'package:http/http.dart' as http;
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';
//import 'package:firebase_auth/firebase_auth.dart';

//import 'package:google_sign_in/google_sign_in.dart';


class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginValidate objLoginValidate = new LoginValidate();
  UserController objUserController = new UserController();

  //validate
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String email, password;

  //Creation of the names of the text fields, which is stored in the data
  final emailcontrol01 = TextEditingController();
  final passcontrol01 = TextEditingController();

  @override
  void initState() {
    super.initState();
    //  initGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Iniciar Sesión',
              style: new TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'Segoe UI',
                color: Colors.grey,
                fontSize: 30.0,
              ),
            ),
            SizedBox(height: 30.0),
            Form(
                key: _key,
                autovalidate: _validate,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: TextFormField(
                        controller: emailcontrol01,
                        maxLength: 32,
                        //keyboardType: TextInputType.emailAddress,
                        //validator: validateUser,
                        onSaved: (String value) {
                          email = value;
                        },
                        decoration: InputDecoration(
                          icon: Icon(Icons.account_circle, color: Colors.amber),
                          labelText: 'Username',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: TextFormField(
                        controller: passcontrol01,
                        obscureText: true,
                        maxLength: 32,
                        //keyboardType: TextInputType.number,
                        //validator: validatePassword,
                        onSaved: (String value) {
                          password = value;
                        },
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.security,
                            color: Colors.amber,
                          ),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 40.0),
                          child: Text(
                            "¿Olvidaste tu contraseña?",
                            style: new TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.0),
                    ButtonTheme(
                      minWidth: 350.0,
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {
                          sendToServer(emailcontrol01.text, passcontrol01.text);
                        },
                        textColor: Colors.white,
                        color: Colors.amber,
                        child: new Text(
                          "Comencemos",
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
//                            Navigator.push(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (context) => RegisterPage()));
                          },
                          child: Text(
                            "¿No tienes una cuenta?",
                            style: new TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          "Ó",
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
//                              _signIn(context)
//                                  .then((FirebaseUser user) => print(user))
//                                  .catchError((e) => print(e));
//                              print("facebook.");
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 30.0,
                              child: Image.asset('assets/img/facebook.png'),
                            ),
                          ),
                        ),
                        SizedBox(width: 20.0),
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              //     objGoogleSession.handleSignIn();
                              print("google.");
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 20.0,
                              child: Image.asset('assets/img/search.png'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }


  //Metodo
  sendToServer(user, pass) {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
      print("Password $password");
      print("Email $email");
      objUserController.getTokenUser(user, pass);
      if (user ==emailcontrol01.text && pass == passcontrol01.text) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AddData()));
      } else {
        objLoginValidate.showDialog1(context);
      }
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }


}
