import 'package:flipnpair/GamePages/fourCrossThree.dart';
import 'package:flipnpair/GamePages/iveCrossFour.dart';
import 'package:flipnpair/GamePages/threeCrossTwo.dart';
import 'package:flipnpair/util/appColors.dart';
import 'package:flutter/material.dart';

class DifficultySelection extends StatefulWidget {
  final int themeIndex;
  const DifficultySelection({
    super.key,
    required this.themeIndex,
  });

  @override
  State<DifficultySelection> createState() => _DifficultySelectionState();
}

class _DifficultySelectionState extends State<DifficultySelection> {
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
                      builder: (context) => ThreeCrossTwo(
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
                      builder: (context) => FourCrossThree(
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
                      builder: (context) => FiveCrossFour(
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
