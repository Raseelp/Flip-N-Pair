class Game {
  final String hiddenCardPath = 'assets/images/hidden.png';
  final int cardCount;
  List<String>? gameImg;
  final List<String> cardsList = [
    'assets/images/1.png',
    'assets/images/3.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/1.png',
    'assets/images/2.png',
  ];
  List<Map<int, String>> matchCheck = [];

  Game({required this.cardCount});

  void initGame() {
    gameImg = List.generate(
      cardCount,
      (index) => hiddenCardPath,
    );
  }
}
