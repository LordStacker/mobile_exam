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

  Map serialiseJson(String json) {
    return jsonDecode(json);
  }
}