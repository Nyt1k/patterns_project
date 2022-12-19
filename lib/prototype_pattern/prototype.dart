class Frame {
  final int details;
  final int size;

  const Frame(this.details, this.size);

  Frame copyWith({
    int? details,
    int? size,
  }) {
    return Frame(
      details ?? this.details,
      size ?? this.size,
    );
  }

  Frame clone() => copyWith(details: details, size: size);
}

class PrototypeApp {
  static void makeFrames() {
    final f1 = Frame(6, 240);
    final f2 = f1.clone();

    print('Is f1 == f2 : ${f1 == f2}');

    final f3 = f1;

    print('Is f1 == f3 : ${f1 == f3}');
  }
}
