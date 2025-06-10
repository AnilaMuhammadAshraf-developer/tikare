import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tikare/constants/api_constants.dart';


class ContentService {
  Future getContentUrl(type) async {
    final response = await http.post(Uri.parse(ApiConstants.contentEndpoint),body: {'type': type});

    if (response.statusCode == 200) {
     final data = jsonDecode(response.body);
  
      return data['data'];
      
    } else {
      throw Exception('Failed to load content.');
    }
  }
}
