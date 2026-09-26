import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkInteractor {
  String url;
  NetworkInteractor({required this.url});

  Future getData() async {
    print(url);
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Failed to get data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
