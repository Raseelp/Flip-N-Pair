class Game {
  final String hiddenCardPath = 'assets/images/hidden.png';
  final int cardCount;
  final int themeIndex;
  List<String>? gameImg;
  final List<List<String>> themes = [
    [
      'assets/images/1.png',
      'assets/images/2.png',
      'assets/images/3.png',
      'assets/images/4.png',
      'assets/images/5.png',
      'assets/images/6.png',
      'assets/images/7.png',
      'assets/images/8.png',
      'assets/images/9.png',
      'assets/images/10.png',
    ],
    [
      'assets/images/c5.png',
      'assets/images/c7.png',
      'assets/images/c2.png',
      'assets/images/c6.png',
      'assets/images/c3.png',
      'assets/images/c4.png',
      'assets/images/c1.png',
      'assets/images/c8.png',
      'assets/images/c9.png',
      'assets/images/c10.png',
    ]
  ];

  List<String> cardsList = [];

  void generateImages(int gridSize) {
    int uniqueImageCount = gridSize ~/ 2;
    final List<String> selectedImages =
        themes[themeIndex].sublist(0, uniqueImageCount);
    cardsList = [...selectedImages, ...selectedImages];
    cardsList.shuffle();
  }

  List<Map<int, String>> matchCheck = [];

  Game(this.themeIndex, {required this.cardCount});

  void initGame() {
    gameImg = List.generate(
      cardCount,
      (index) => hiddenCardPath,
    );
  }
}
