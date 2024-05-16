import 'dart:convert';

class JsonService {
  String testJsonMeasurements = '''
{
  "sensor_id": 1,
  "device_id": 1,
  "sound_level": 69,
  "temperature": 69,
  "humidity": "normal",
  "date": "2021-10-10T10:10:10.000Z"
}
''';

  Map deserialiseJson(String json) {
    return jsonDecode(json);
  }

  String serialiseJson(Map json) {
    return jsonEncode(json);
  }
}