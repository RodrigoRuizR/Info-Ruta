import 'dart:convert';

import 'package:http/http.dart' as http;

String ip = '10.0.2.2:3001';

Future<Map<String, dynamic>> register(int userType, String name, String email, String username, String password) async {
  Map<String, String> headers = {'Content-Type': 'application/json'};
  String url = '/api/sign-up';
  try {
    final result = await http.post(Uri.http(ip, url),
        headers: headers,
        body: json.encode(
          {'userType':userType, 'name':name, 'email': email, 'username':username, 'password': password},
        ));
    if (result.statusCode == 201) {
      final data = json.decode(result.body);
      Map<String, dynamic> obtener = {'status': data['status']};
      print('status 201 ok');
      return obtener;
    } else {
      return {'status': 'error'};
    }
  } catch (e) {
    return {'status': 'error'};
  }

}