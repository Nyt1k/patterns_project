abstract class MusicDatabaseApi {
  void getSong();
}

class MusicDatabaseService implements MusicDatabaseApi {
  final String songName;

  MusicDatabaseService(this.songName);

  @override
  void getSong() {
    print('Downloading song...');
    print('Song * $songName * downloaded!\r\n');
  }
}

class CachedMusicDatabaseProxy implements MusicDatabaseApi {
  final String _cachedSong;
  MusicDatabaseApi? _musicDatabaseService;
  CachedMusicDatabaseProxy(this._cachedSong, [this._musicDatabaseService]);

  @override
  void getSong() {
    if (_musicDatabaseService != null) {
      print('Getting song from local database...');
    } else {
      _musicDatabaseService = MusicDatabaseService('$_cachedSong(from cache)');
    }
    _musicDatabaseService!.getSong();
  }
}
