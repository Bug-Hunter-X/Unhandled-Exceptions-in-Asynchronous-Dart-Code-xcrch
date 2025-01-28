```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      //More specific error handling based on status code
      throw Exception('API request failed with status: ${response.statusCode}, Message: ${response.body}');
    }
  } on FormatException catch (e) {
    //Handle JSON decoding errors specifically
    print('Error decoding JSON: $e');
    return null; // Or throw a custom exception
  } on SocketException catch (e) {
    //Handle network errors
    print('Network error: $e');
    return null; // Or throw a custom exception
  } catch (e) {
    print('An unexpected error occurred: $e');
    return null; // Or rethrow
  }
}
```