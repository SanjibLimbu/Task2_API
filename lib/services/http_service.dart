import "package:http/http.dart" as http;

class PersistentHttp {
  static var client = http.Client();
  static const baseUrl = 'https://jsonplaceholder.typicode.com/';
}
