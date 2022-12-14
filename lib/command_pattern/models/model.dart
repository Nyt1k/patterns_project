abstract class ActionHandler {
  Set<String> get actions;
}

abstract class Command {
  ActionHandler actionHandler;
  late String name;

  Command(this.actionHandler);

  @override
  String toString() => name;

  void execute();
}

class Handler {
  List<String> history = [];

  void execute(Command command) {
    command.execute();
    history.add('${DateTime.now()} Executed: $command');
  }

  @override
  String toString() => history.fold(
      '', (previousValue, element) => '$previousValue$element\r\n');
}

class Video implements ActionHandler {
  void play() => print('Play the video');
  void pause() => print('Pause the video');
  void nextVideo() => print('Play next video');
  void prevVideo() => print('Play prev video');
  @override
  Set<String> get actions => Set.from({
        'play',
        'pause',
        'next',
        'prev',
      });
}

class PlayCommand extends Command {
  @override
  String name = 'Play';

  PlayCommand(Video video) : super(video);

  @override
  void execute() {
    (actionHandler as Video).play();
  }
}

class PauseCommand extends Command {
  @override
  String name = 'Pause';

  PauseCommand(Video video) : super(video);

  @override
  void execute() {
    (actionHandler as Video).pause();
  }
}

class NextVideo extends Command {
  @override
  String name = 'Next';

  NextVideo(Video video) : super(video);

  @override
  void execute() {
    (actionHandler as Video).nextVideo();
  }
}

class PrevVideo extends Command {
  @override
  String name = 'Prev';

  PrevVideo(Video video) : super(video);

  @override
  void execute() {
    (actionHandler as Video).prevVideo();
  }
}

class CommandPanel {
  Handler _handler = Handler();
  final Video video;

  CommandPanel(this.video);

  String get commandHistory => _handler.toString();

  void control(String action) {
    if (!video.actions.contains(action)) {
      return print('Unknown action');
    }
    switch (action) {
      case 'play':
        return _handler.execute(PlayCommand(video));
      case 'pause':
        return _handler.execute(PauseCommand(video));
      case 'next':
        return _handler.execute(NextVideo(video));
      case 'prev':
        return _handler.execute(PrevVideo(video));
    }
  }
}

