import 'dart:convert';
import 'dart:io';
import 'dart:async';

class Register {
  String tokens;
  String username;
  String type;
  int status;

  //Recibir datos Rest se utiliza Future y async
  Future<Register> apiRequest(String url, Map jsonMap) async {
    Register obj = new Register();
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(jsonMap)));
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    var resbody = json.decode(reply);
    //Captura los datos del Post
    obj.username = username = resbody['aceptaTerminos'];
    obj.username = username = resbody['activo'];
    obj.username = username = resbody['apellidoMaterno'];
    obj.username = username = resbody['apellidoPaterno'];
    obj.username = username = resbody['celular'];
    obj.username = username = resbody['celularVerificado'];
    obj.username = username = resbody['celularVerificado'];
    obj.username = username = resbody['celularVerificado'];
    obj.username = username = resbody['celularVerificado'];
    httpClient.close();
    //retorna un String
    return obj;
  }
}