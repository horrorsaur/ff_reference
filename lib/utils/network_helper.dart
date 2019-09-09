import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future<dynamic> getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      print('Contacted MoogleAPI w/ ${response.statusCode}');
      String data = response.body;
      return jsonDecode(data);
    } else {
      print('Contacted MoogleAPI w/ ${response.statusCode}');
    }
  }
}
