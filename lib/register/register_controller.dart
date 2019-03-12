
import 'package:flutter_app/login/DatabaseUser.dart';
import 'package:flutter_app/register/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
class RegisterController {
  Register obj = new Register();
  var db = new DatabaseHelper();
  int status = 0 ;
  String status1 = "";
    //Funcion de Validar Administrador
  getTokenUser(String user, String pass) async {
    String url =
        'http://192.168.1.61:8084/api/administrador/create';
    Map map = {
      //Concatena los parametros que se va a enviar en el Post
      "username":""+user,"password":""+pass,
    };
    //prueba de recepcion de user y pass
    print("mapeo usuario : "+user);
    print("mapeos password : "+pass);
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