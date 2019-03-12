import 'dart:convert';

import 'package:flutter/material.dart';


import 'package:flutter_app/register/register.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController {
  Register obj = new Register();

  int status = 0 ;
  String status1 = "";
  //Funcion de Validar Administrador
  getTokenUser() async {
    String url =
        'http://192.168.1.61:8084/api/administrador/create';
    Map map = {
      //Concatena los parametros que se va a enviar en el Post
      "aceptaTerminos": true,
      "activo": true,
      "apellidoMaterno": "Durand",
      "celular": "123456789",
      "celularVerificado": true,
      "codigoActivacionCelular": "1111",
      "codigoActivacionEmail": "1",
      "email": "aaa111a@gmail.com",
      "emailVerificado": true,
      "fechaRegistro": "2019-03-03 16:47:09.983",
      "idFiscal": "",
      "idPais": {
        "id": "1",
      },
      "idRol": {
        "id": "2",
      },
      "nombreAdministrador": "Mascota",
      "password": "josue",
      "razonSocial": "sozial",
      "usuario": "josue1213",
    };
    //prueba de recepcion de user y pass

    obj = (await obj.apiRequest(url, map));

    print("get rest tokens"+obj.tokens);
    final prefs = await SharedPreferences.getInstance();
    String token1 = obj.tokens;
    print("Recibio Token localstorege"+token1);
    prefs.setString('token', token1);
    //Guardar en Sqlflite

    return obj;
  }



}

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerNombres = new TextEditingController();
  TextEditingController controllerApellidos = new TextEditingController();
  TextEditingController controllerDni = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();

  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerPrice = new TextEditingController();
  TextEditingController controllerStock = new TextEditingController();

  Future<http.Response> postRequest () async {
    var url ='http://192.168.1.61:8084/api/administrador/create';
    var body =({
      'aceptaTerminos': 'true',
      'activo': 'true',
      'apellidoMaterno': 'Durand',
      'celular': '123456789',
      'celularVerificado': 'true',
      'codigoActivacionCelular': '1111',
      'codigoActivacionEmail':'1',
      'email': 'aaa111a@gmail.com',
      'emailVerificado': 'true',
      'fechaRegistro': '2019-03-03 16:47:09.983',
      'idFiscal': '',
      'idPais': {'id': '1'},
      'idRol': {'id': '2'},
      'nombreAdministrador': 'Mascota',
      'password': 'josue',
      'razonSocial': 'sozial',
      'usuario': 'josue1213',
    });

    print("Body: " );

    http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body
    ).then((http.Response response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.contentLength}");
      print(response.headers);
      print(response.request);

    });
  }

  void addData1() {
    var url = "http://192.168.1.61:8084/api/administrador/create";
    http.post(url, body: {
      "aceptaTerminos": "true",
      "activo": "true",
      "apellidoMaterno": "Durand",
      "celular": "123456789",
      "celularVerificado": "true",
      "codigoActivacionCelular": "1111",
      "codigoActivacionEmail": "1",
      "email": "aaa111a@gmail.com",
      "emailVerificado": "true",
      "fechaRegistro": "2019-03-03 16:47:09.983",
      "idFiscal": "",
      "idPais": {
        "id": "1",
      },
      "idRol": {
        "id": "2",
      },
      "nombreAdministrador": "Mascota",
      "password": "josue",
      "razonSocial": "sozial",
      "usuario": "josue1213",
    });
  }

  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String email, password;
  RegisterController objUserController = new RegisterController();

  sendToServer() {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
      print("Password $password");
      print("Email $email");
      objUserController.getTokenUser();

    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("AGREGAR PRUEBA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerName,
                  decoration: new InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                  ),
                ),
                new TextField(
                  controller: controllerName,
                  decoration: new InputDecoration(
                    hintText: "Nombres",
                    labelText: "Nombres",
                  ),
                ),
                new TextField(
                  controller: controllerPrice,
                  decoration: new InputDecoration(
                    hintText: "Apellidos",
                    labelText: "Apellidos",
                  ),
                ),
                new TextField(
                  controller: controllerStock,
                  decoration: new InputDecoration(
                    hintText: "Dni",
                    labelText: "Dni",
                  ),
                ),
                new TextField(
                  controller: controllerStock,
                  decoration: new InputDecoration(
                    hintText: "Dni",
                    labelText: "Dni",
                  ),
                ),
                new Padding(padding: const EdgeInsets.all(10.0)),
                new RaisedButton(
                  child: new Text("Agrega Con Fe"),
                  color: Colors.blueAccent,
                  onPressed: () {
                   // sendToServer();
                    postRequest();
                   // addData1();
                  //  objUserController.getTokenUser();
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
