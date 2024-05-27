class GlobalSettings {
  // Singleton for the global settings variables to ensure they are only created once and edited on the same instance
  GlobalSettings._privateConstructor();

  static final GlobalSettings _instance = GlobalSettings._privateConstructor();

  factory GlobalSettings() {
    return _instance;
  }

  bool isCelsius = true;

  bool is24Hour = true;

  bool enableNotifications = true;

  Map currentUser = {
    'username': '',
    'id': 0,
  };

  String? token = '';

  void toggleCelsius() {
    isCelsius = !isCelsius;
  }

  void toggle24Hour() {
    is24Hour = !is24Hour;
  }

  void toggleNotifications() {
    enableNotifications = !enableNotifications;
  }

  String checkConvertTime(String time) {
    if (is24Hour) {
      return time;
    } else {
      final timeSplit = time.split(':');
      final hour = int.parse(timeSplit[0]);
      final minute = int.parse(timeSplit[1]);
      final second = int.parse(timeSplit[2]);
      if (hour > 12) {
        return '${hour - 12}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')} PM';
      } else if (hour == 0) {
        return '12:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')} AM';
      } else {
        return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')} AM';
      }
    }
  }
}
