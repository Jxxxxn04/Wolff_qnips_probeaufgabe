import 'package:http/http.dart' as http;

class ApiService {
  static const String requestURL = "https://my.qnips.io/dbapi/ha";

  static Future<http.Response> getResponse() async {
    final url = Uri.parse(requestURL);
    final headers = {'Content-Type': 'application/json'};
    return await http.get(url, headers: headers);
  }
}