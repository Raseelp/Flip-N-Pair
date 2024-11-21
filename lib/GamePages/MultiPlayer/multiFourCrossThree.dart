import 'package:flipnpair/homePage.dart';
import 'package:flipnpair/util/appColors.dart';
import 'package:flipnpair/util/gameLogic.dart';
import 'package:flutter/material.dart';

class Multifourcrossthree extends StatefulWidget {
  final int themeIndex;
  const Multifourcrossthree({super.key, required this.themeIndex});

  @override
  State<Multifourcrossthree> createState() => _Multifourcrossthree();
}

class _Multifourcrossthree extends State<Multifourcrossthree> {
  int blueScore = 0; // Score for player 1 (Blue)
  int redScore = 0; // Score for player 2 (Red)
  int tries = 0;
  bool isBlueTurn = true;
  int match = 0;
  String Winner = '';
  // To track elapsed time

  late Game _game;
  @override
  void initState() {
    _game = Game(widget.themeIndex, cardCount: 12);
    super.initState();
    _game.initGame();
    _game.generateImages(12);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.lightCyan,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.17,
              decoration: const BoxDecoration(
                color: AppColors.secondaryAccent,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        showPauseDialog();
                      },
                      icon: Icon(
                        Icons.pause_circle_filled_outlined,
                        color: AppColors.primaryAccent,
                        size: screenHeight * .07,
                      )),
                  _buildPlayerStatus('Blue', blueScore, isBlueTurn),
                  _buildPlayerStatus('Red', redScore, !isBlueTurn),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(screenHeight * 0.02),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: _game.gameImg!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          tries++;
                          _game.gameImg![index] = _game.cardsList[index];
                          _game.matchCheck.add({index: _game.cardsList[index]});
                        });
                        if (_game.matchCheck.length == 2) {
                          if (_game.matchCheck[0].values.first ==
                              _game.matchCheck[1].values.first) {
                            if (isBlueTurn) {
                              blueScore += 1;
                            } else {
                              redScore += 1;
                            }
                            match++;
                            if (match == 6) {
                              if (blueScore > redScore) {
                                Winner = 'BLUE';
                              } else {
                                Winner = 'RED';
                              }
                              showVictoryDiolog(blueScore, redScore, Winner);
                            }
                            _game.matchCheck.clear();
                          } else {
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              setState(() {
                                _game.gameImg![_game.matchCheck[0].keys.first] =
                                    _game.hiddenCardPath;
                                _game.gameImg![_game.matchCheck[1].keys.first] =
                                    _game.hiddenCardPath;
                                _game.matchCheck.clear();
                                isBlueTurn = !isBlueTurn;
                              });
                            });
                          }
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(_game.gameImg![index]),
                                fit: BoxFit.cover)),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerStatus(String player, int score, bool isActive) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
        color: isActive
            ? (player == 'Blue' ? Colors.blue : Colors.red)
            : Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          '$player: $score',
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }

  void showVictoryDiolog(int bluescores, int redScores, String Winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: AlertDialog(
            backgroundColor: AppColors.pastelYellow,
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                children: [
                  Text(
                    '$Winner WINS!',
                    style:
                        TextStyle(color: AppColors.primaryText, fontSize: 35),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        width: 100,
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: double.infinity,
                              color: AppColors.cardBack,
                              child: Center(
                                child: Text(
                                  'Blue',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Text(
                              '$bluescores',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        width: 100,
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: double.infinity,
                              color: AppColors.primaryAccent,
                              child: Center(
                                child: Text(
                                  'Red',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Text(
                              '$redScores',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.primaryAccent),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Multifourcrossthree(
                                          themeIndex: widget.themeIndex,
                                        )));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.width * 0.15,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              color: AppColors.lightCyan,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.restart_alt_rounded,
                              size: 40,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Homepage(),
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.width * 0.15,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              color: AppColors.lightCyan,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.home_outlined,
                              size: 40,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showPauseDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.pastelYellow,
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              children: [
                const Text(
                  'Paused',
                  style: TextStyle(color: AppColors.primaryText, fontSize: 35),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.primaryAccent),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Multifourcrossthree(
                                  themeIndex: widget.themeIndex,
                                ),
                              ));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.width * 0.15,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: AppColors.lightCyan,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.restart_alt_rounded,
                            size: 40,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.width * 0.15,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: AppColors.lightCyan,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.pause_outlined,
                            size: 40,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Homepage(),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.width * 0.15,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: AppColors.lightCyan,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.home_outlined,
                            size: 40,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
