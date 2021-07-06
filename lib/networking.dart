import 'dart:convert';

import 'package:http/http.dart' as http;
import 'articleClass.dart';

class Network {
  Future<List<articleClass>> getAllData() async {
    final url = 'https://api.nytimes.com/svc/topstories/v2/home.json?api-key=3mh2JkNo6RqrYZxAnNmdyvLdFnKBMfh9';
    var response = await http.get(url);
    List data = json.decode(response.body);
    return data;
  }
}