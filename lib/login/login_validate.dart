import 'package:flutter/material.dart';

import 'package:flutter_app/login/user_controller.dart';

class LoginValidate {
  UserController obj1 = new UserController();
  String email, password;

  String validateUser(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Se requiere email para ingresar.";
    } else if(!regExp.hasMatch(value)){
      return "Email Invalido.";
    }else {
      return null;
    }
  }
  String validatePassword(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Se requiere una contraseña para ingresar.";
    } else if(value.length != 10){
      return "Se requiere una longitud maximo de 10 digitos para ingresar.";
    }else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }
   showDialog1(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Error revise su correo o contraseña",style: TextStyle(color: Colors.red)),
        );
      },
    );
  }
}