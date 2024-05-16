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
  };

  void toggleCelsius() {
    isCelsius = !isCelsius;
  }

  void toggle24Hour() {
    is24Hour = !is24Hour;
  }

  void toggleNotifications() {
    enableNotifications = !enableNotifications;
  }
}
