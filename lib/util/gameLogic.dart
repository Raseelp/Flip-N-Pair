class Game {
  final String hiddenCardPath = 'assets/images/hidden.png';
  final int cardCount;
  List<String>? gameImg;
  final List<String> imagePath = [
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
  ];

  List<String> cardsList = [];

  void generateImages(int gridSize) {
    int uniqueImageCount = gridSize ~/ 2;
    final List<String> selectedImages = imagePath.sublist(0, uniqueImageCount);
    cardsList = [...selectedImages, ...selectedImages];
    cardsList.shuffle();
  }

  List<Map<int, String>> matchCheck = [];

  Game({required this.cardCount});

  void initGame() {
    gameImg = List.generate(
      cardCount,
      (index) => hiddenCardPath,
    );
  }
}
