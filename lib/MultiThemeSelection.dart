import 'package:flipnpair/GamePages/MultiPlayer/multiDifficulty.dart';

import 'package:flipnpair/util/appColors.dart';
import 'package:flutter/material.dart';

class Multithemeselection extends StatelessWidget {
  const Multithemeselection({super.key});

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
              'Select a theme',
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenHeight * .4,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MultiDifficulty(themeIndex: 0)));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.116,
                      vertical: screenHeight * 0.02),
                  child: const Text('FOOTBALL',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                )),
            SizedBox(
              height: screenHeight * .03,
            ),
            SizedBox(
              height: screenHeight * .03,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MultiDifficulty(themeIndex: 1)));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.13,
                    vertical: screenHeight * 0.018),
                child: const Text('Siuuuuuuuuuuu',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
