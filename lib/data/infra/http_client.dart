import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class HttpClient {
  factory HttpClient() => _DartHttpClient();
  Future<dynamic> get(String url, {Map headers});
}

class _DartHttpClient implements HttpClient {
  final _client = http.Client();

  Future<dynamic> get(String url, {Map headers}) async {
    final response = await _client.get(Uri.parse(url), headers: headers);
    return json.decode(response.body);
  }
}
