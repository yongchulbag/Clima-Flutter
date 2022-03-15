import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkGetData {
  NetworkGetData(this.url);

  final String url;

  Future get() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String return_weatherdata = response.body;

      return jsonDecode(return_weatherdata);

    } else {
      print(response.statusCode);
    }

    print(response.body);
  }
}
