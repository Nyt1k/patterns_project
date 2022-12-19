import 'package:patterns_project/command_pattern/models/model.dart';

class CommandApp {
  static void handleVideo() {
    final video = Video();
    final videoPanel = CommandPanel(video);

    print('\r\nCommand:');
    videoPanel.control('play');
    videoPanel.control('pause');
    videoPanel.control('next');
    videoPanel.control('prev');
    videoPanel.control('delete');

    print('Command logs:\r\n${videoPanel.commandHistory}');
  }
}
