abstract class Programmer {
  void writeBackEnd(BackEnd backEnd);
  void writeFrontEnd(FrontEnd frontEnd);
  void addDataBase(DataBase dataBase);
}

abstract class WebSiteParts {
  void makePart(Programmer programer);
}

class FrontEnd implements WebSiteParts {
  final String frameWork;

  FrontEnd(this.frameWork);
  @override
  void makePart(Programmer programer) {
    programer.writeFrontEnd(this);
  }
}

class BackEnd implements WebSiteParts {
  final String frameWork;

  BackEnd(this.frameWork);
  @override
  void makePart(Programmer programer) {
    programer.writeBackEnd(this);
  }
}

class DataBase implements WebSiteParts {
  final String dataBase;

  DataBase(this.dataBase);
  @override
  void makePart(Programmer programer) {
    programer.addDataBase(this);
  }
}

class MEANProgrammer implements Programmer {
  @override
  void addDataBase(DataBase dataBase) {
    print(' Programmer used ${dataBase.dataBase} database to website.');
  }

  @override
  void writeBackEnd(BackEnd backEnd) {
    print(' Programmer added backEnd to website using ${backEnd.frameWork}.');
  }

  @override
  void writeFrontEnd(FrontEnd frontEnd) {
    print(' Programmer added frontEnd to website using ${frontEnd.frameWork}.');
  }
}

class VisitorApp {
  static void makeWebsite() {
    MEANProgrammer meanProgrammer = MEANProgrammer();

    List<WebSiteParts> parts = [
      FrontEnd('JavaScript, AngularJS'),
      BackEnd('Node.js, Express'),
      DataBase('MongoDB'),
    ];

    print('Full stack MEAN programmer start making website');
    for (var part in parts) {
      part.makePart(meanProgrammer);
    }
    print('Website created!');
  }
}
