import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/models/equina_model.dart';
import 'end_point.dart';

class ApiFunction {
  static const Duration _timeoutDuration = Duration(seconds: 10);

  static Future<EquinaResponse> fetchLessons() async {
    try {
      final response = await http.get(
        Uri.parse('${EndPoint.baseUrl}/lessons_list/1'),
      ).timeout(_timeoutDuration);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return EquinaResponse.fromJson(jsonData);
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        throw Exception('Client error: ${response.statusCode}');
      } else if (response.statusCode >= 500) {
        throw Exception('Server error: ${response.statusCode}');
      } else {
        throw Exception('Unexpected error: ${response.statusCode}');
      }
    } on http.ClientException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }


}
