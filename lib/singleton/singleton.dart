class CachedData {
  CachedData._internal();
  static const String _data = 'SIMPLE DATA';
  static final CachedData _cacher = CachedData._internal();
  factory CachedData() => _cacher;

  void watchData() {
    print(_data);
  }
}
