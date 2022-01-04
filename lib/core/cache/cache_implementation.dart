import 'package:injectable/injectable.dart';
import 'package:rent_ready_task/core/cache/cache.dart';

@LazySingleton(as: Cache)
class CacheImplementation extends Cache {
  final _storage = <String, dynamic>{};

  @override
  void clear() {
    _storage.clear();
  }

  @override
  bool contains(String key) {
    return _storage.containsKey(key);
  }

  @override
  V? get<V>(String key) {
    return _storage[key];
  }

  @override
  bool getBoolean(String key) {
    return _storage[key];
  }

  @override
  double getDouble(String key) {
    return _storage[key];
  }

  @override
  int getInt(String key) {
    return _storage[key];
  }

  @override
  List<V>? getList<V>(String key) {
    return _storage[key];
  }

  @override
  String getString(String key) {
    return _storage[key];
  }

  @override
  bool isEmpty() {
    return _storage.isEmpty;
  }

  @override
  void remove(String key) {
    _storage.remove(key);
  }

  @override
  void set<V>(String key, V value) {
    _storage[key] = value;
  }

  @override
  void setBoolean(String key, bool value) {
    _storage[key] = value;
  }

  @override
  void setDouble(String key, double value) {
    _storage[key] = value;
  }

  @override
  void setInt(String key, int value) {
    _storage[key] = value;
  }

  @override
  void setString(String key, String value) {
    _storage[key] = value;
  }

}