import 'package:patterns_project/proxy_pattern/models/model.dart';

class ProxyApp {
  static  void getSong() {
    MusicDatabaseApi proxy = CachedMusicDatabaseProxy(
      'All stars',
    );

    proxy.getSong();
    proxy.getSong();
  }
}
