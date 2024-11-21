import 'package:flipnpair/GamePages/MultiPlayer/MultiThreeCrossTwo.dart';
import 'package:flipnpair/GamePages/MultiPlayer/multiFiveCrossFour.dart';
import 'package:flipnpair/GamePages/MultiPlayer/multiFourCrossThree.dart';
import 'package:flipnpair/util/appColors.dart';
import 'package:flutter/material.dart';

class MultiDifficulty extends StatefulWidget {
  final int themeIndex;
  const MultiDifficulty({super.key, required this.themeIndex});

  @override
  State<MultiDifficulty> createState() => _MultiDifficultyState();
}

class _MultiDifficultyState extends State<MultiDifficulty> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.lightCyan,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Select Difficulty',
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenHeight * .2,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MultiThreeCrossTwo(
                        themeIndex: widget.themeIndex,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.13,
                      vertical: screenHeight * 0.02),
                  child: const Text('3 X 2',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                )),
            SizedBox(
              height: screenHeight * .02,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Multifourcrossthree(
                        themeIndex: widget.themeIndex,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.13,
                      vertical: screenHeight * 0.02),
                  child: const Text('4 X 3',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                )),
            SizedBox(
              height: screenHeight * .02,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MultiFivecrossFour(
                        themeIndex: widget.themeIndex,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.13,
                      vertical: screenHeight * 0.018),
                  child: const Text('5 X 4',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ))
          ],
        ),
      ),
    );
  }
}
