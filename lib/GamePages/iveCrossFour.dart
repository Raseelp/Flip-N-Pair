import 'package:flipnpair/homePage.dart';
import 'package:flipnpair/util/appColors.dart';
import 'package:flipnpair/util/gameLogic.dart';
import 'package:flutter/material.dart';

class FiveCrossFour extends StatefulWidget {
  const FiveCrossFour({super.key});

  @override
  State<FiveCrossFour> createState() => _FiveCrossFourState();
}

class _FiveCrossFourState extends State<FiveCrossFour> {
  int tries = 0;
  int scores = 0;
  Game _game = Game(cardCount: 20);
  @override
  void initState() {
    super.initState();
    _game.initGame();
    _game.generateImages(20);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.background,
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
                  Container(
                    width: screenWidth * 0.2,
                    height: screenHeight * 0.04,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.primaryAccent,
                    ),
                    child: Center(
                      child: Text(
                        '$scores',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.2,
                    height: screenHeight * 0.04,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.primaryAccent,
                    ),
                    child: Center(
                      child: Text(
                        '$tries',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.2,
                    height: screenHeight * 0.04,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.primaryAccent,
                    ),
                    child: const Center(
                      child: Text(
                        'Time',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(screenHeight * 0.02),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 5,
                  ),
                  itemCount: _game.gameImg!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          print(_game.cardsList[index]);
                          tries++;
                          _game.gameImg![index] = _game.cardsList[index];
                          _game.matchCheck.add({index: _game.cardsList[index]});
                        });
                        if (_game.matchCheck.length == 2) {
                          if (_game.matchCheck[0].values.first ==
                              _game.matchCheck[1].values.first) {
                            print('True');
                            scores += 100;
                            _game.matchCheck.clear();
                          } else {
                            print('false');
                            Future.delayed(Duration(milliseconds: 500), () {
                              setState(() {
                                _game.gameImg![_game.matchCheck[0].keys.first] =
                                    _game.hiddenCardPath;
                                _game.gameImg![_game.matchCheck[1].keys.first] =
                                    _game.hiddenCardPath;
                                _game.matchCheck.clear();
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

  void showVictoryDiolog(int moves, int scores) {
    showDialog(
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
              height: MediaQuery.of(context).size.width * 1.2,
              child: Column(
                children: [
                  const Text(
                    'WELL DONE!',
                    style:
                        TextStyle(color: AppColors.primaryText, fontSize: 35),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.width * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.lightCyan,
                        border: Border.all()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Moves: $moves',
                          style: const TextStyle(
                              fontSize: 25, color: AppColors.primaryText),
                        ),
                        const Text(
                          'Time: 200',
                          style: TextStyle(
                              fontSize: 25, color: AppColors.primaryText),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.secondaryAccent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                                color: AppColors.lightCyan,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              width: double.infinity,
                              child: const Center(
                                  child: Text(
                                'Totel:',
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryText),
                              )),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: AppColors.primaryAccent,
                                  borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(20))),
                              width: double.infinity,
                              child: Center(
                                  child: Text(
                                '$scores',
                                style: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
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
                                  builder: (context) => FiveCrossFour(),
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
                                builder: (context) => FiveCrossFour(),
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
