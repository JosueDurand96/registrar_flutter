import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class RegisterPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final correovalidation3 = TextEditingController();
  bool _rememberMeFlag = false;
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String email, mobile;

  @override
  Widget build(BuildContext context) {
    /*return MaterialApp(
      home: new Scaffold(
        body: new Center(
          child: new Container(
            margin: new EdgeInsets.only(left: 10.0,right: 10.0,top: 100.0,bottom: 10.0),
            padding: new  EdgeInsets.only(left: 10.0,right: 10.0,top: 100.0,bottom: 0.0),
            child: new Form(
              key: _key,

              autovalidate: _validate,
              child: FormUI(),
            ),
          ),
        ),
      ),
    )*/
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Registro',
              style: new TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'Segoe UI',
                color: Colors.black,
                fontSize: 30.0,
              ),
            ),
            SizedBox(height: 30.0),
            Form(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.email, color: Colors.amber),
                        labelText: 'Ingrese email',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.account_circle,
                          color: Colors.amber,
                        ),
                        labelText: 'Ingrese nombres',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.account_circle,
                          color: Colors.amber,
                        ),
                        labelText: 'Ingrese apellidos',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.format_list_numbered,
                          color: Colors.amber,
                        ),
                        labelText: 'Dni',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.security,
                          color: Colors.amber,
                        ),
                        labelText: 'Ingrese contraseña',
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  new Row(
                    children: <Widget>[
                      new GestureDetector(
                        child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.center,

                          children: <Widget>[
                            new Checkbox(
                              value: _rememberMeFlag,
                              onChanged: (value) => setState(() {
                                    _rememberMeFlag = !_rememberMeFlag;
                                  }),
                            ),
                            new Text(
                              "Acepto los términos y condiciones",
                            )
                          ],
                        ),
                        onTap: () => setState(() {
                              _rememberMeFlag = !_rememberMeFlag;
                            }),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  ButtonTheme(
                    minWidth: 350.0,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
//                        Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => SmsPageState()));
                      },
                      textColor: Colors.white,
                      color: Colors.amber,
                      child: new Text(
                        "Registrar",
                      ),
                    ),
                  ),


                  SizedBox(height: 40.0),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget FormUI() {
    return new Column(
      children: <Widget>[
        new CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('assets/img/correo.png'),
        ),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Correo'),
            keyboardType: TextInputType.emailAddress,
            controller: correovalidation3,
            maxLength: 32,
            validator: validateEmail,
            onSaved: (String val) {
              email = val;
            }),
        new SizedBox(height: 50.0),
        new Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Material(
            borderRadius: BorderRadius.circular(30.0),
            shadowColor: Colors.green.shade100,
            elevation: 5.0,
            child: MaterialButton(
              minWidth: 400.0,
              height: 50.0,
              onPressed: () {
                _sendToServer();
              },
              child: Text('SIGUIENTE',
                  style: TextStyle(color: Colors.white, fontSize: 22)),
            ),
          ),
        )
      ],
    );
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Correo Incorrecto";
    } else {
      return null;
    }
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();

      print("Email $email");
//      Navigator.push(
//        context,
//        MaterialPageRoute(builder: (context) => (SmsPageState())),
//      );
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }
}
