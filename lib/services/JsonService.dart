import 'dart:convert';

class JsonService {
  Map deserialiseJson(String json) {
    return jsonDecode(json);
  }

  String serialiseJson(Map json) {
    return jsonEncode(json);
  }
}
