import 'dart:convert';
import 'package:http/http.dart' as http;

class WebService {
  final String url = "http://todo.ujilari.com/api";

  Future<dynamic> getRequest(String endpoint) async {
    final response = await http.get(url + endpoint);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw json.decode(response.body)['msg'];
    }
  }

  Future<dynamic> postRequest(String endpoint, Map param) async {
    final response = await http.post(url + endpoint, body: param);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw json.decode(response.body)['msg'];
    }
  }
}
