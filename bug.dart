```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Success!  Process the JSON response
      final jsonData = jsonDecode(response.body);
      // Use jsonData...
    } else {
      // Handle error (e.g., throw an exception)
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle general exceptions
    print('Error fetching data: $e');
    // Rethrow the exception to be handled higher up the call stack (optional)
    rethrow;
  }
}
```