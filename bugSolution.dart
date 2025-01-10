```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try{
        final jsonData = jsonDecode(response.body);
        // Process jsonData
        //Example of further processing that might throw an error
        //int someNumber = jsonData['number'];
      } catch(e) {
        print("Error decoding JSON: $e");
        rethrow; //Rethrow to handle further up
      }
    } else {
      // Handle error response
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } on SocketException catch (e) {
    // Handle socket exceptions specifically
    print('SocketException: $e');
    //Handle the error, perhaps by showing an error message to the user
  } on FormatException catch(e){
    //Handle JSON format exception
    print("JSON Format Exception: $e");
  } catch (e) {
    // Handle other exceptions
    print('Error: $e');
    //Handle the error gracefully
  }
}
```