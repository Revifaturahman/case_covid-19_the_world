import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = "https://disease.sh/v3/covid-19/countries";

  Future<List<dynamic>> getAll() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if(response.statusCode == 200){
        return jsonDecode(response.body);
      }else{
        throw Exception("Status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Gagal ke API");
    }
  }
}