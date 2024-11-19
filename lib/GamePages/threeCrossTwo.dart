import 'package:flipnpair/homePage.dart';
import 'package:flipnpair/provider/gameStateProvider.dart';
import 'package:flipnpair/util/appColors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThreeCrossTwo extends StatefulWidget {
  const ThreeCrossTwo({super.key});

  @override
  State<ThreeCrossTwo> createState() => _ThreeCrossTwoState();
}

class _ThreeCrossTwoState extends State<ThreeCrossTwo> {
  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);
    gameState.generateImages(6);
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
                    child: const Center(
                      child: Text(
                        'Points',
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
                        'Swaps',
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
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Image.asset(gameState.images[index],
                        fit: BoxFit.cover);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showVictoryDiolog() {
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
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Moves: 300',
                          style: TextStyle(
                              fontSize: 25, color: AppColors.primaryText),
                        ),
                        Text(
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
                              child: const Center(
                                  child: Text(
                                '600',
                                style: TextStyle(
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
                        Container(
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
                      Container(
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
                      Container(
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
