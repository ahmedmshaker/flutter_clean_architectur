abstract class Cache {
  void clear();

  bool contains(String key);

  V? get<V>(String key);

  bool getBoolean(String key);

  double getDouble(String key);

  List<V>? getList<V>(String key);

  int getInt(String key);

  String getString(String key);

  bool isEmpty();

  void remove(String key);

  void set<V>(String key, V value);

  void setBoolean(String key, bool value);

  void setDouble(String key, double value);

  void setInt(String key, int value);

  void setString(String key, String value);
}
