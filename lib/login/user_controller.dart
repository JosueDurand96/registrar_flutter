
import 'package:flutter_app/login/DatabaseUser.dart';
import 'package:flutter_app/login/user.dart';
import 'package:flutter_app/login/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UserController {
  User obj = new User();
  var db = new DatabaseHelper();
  int status = 0 ;
  String status1 = "";
  //Funcion de Validar Usuario
  getTokenUser(String user, String pass) async {
    String url =
        'http://192.168.1.61:8084/api/auth';
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
    sql(obj);
    Future token = automatic_session();
    print('exites : $token');
    return obj;
  }
  Future sql (User obj1) async {
    List notes;
    await db.saveNote(new UserInfo(obj1.tokens));
    print('=== getAllNotes() ===');
    notes = await db.getAllNotes();
    notes.forEach((note) => print(note));
  }

  Future automatic_session () async {
    status= await db.getCount();
    print('Cantida de fila de la tabla sqlflite: $status');
  }
}