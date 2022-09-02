class Singleton {
  static Singleton? _instance;

  static Singleton getInstance() {
    if (_instance == null) {
      _instance = Singleton();
    }
    return _instance!;
  }
}