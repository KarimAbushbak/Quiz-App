import 'package:flutter/material.dart';
import 'package:quizie/core/resources/manager_colors.dart';
import 'package:quizie/core/resources/manager_font_sizes.dart';
import 'package:quizie/core/resources/manager_font_weight.dart';
class ResultPage extends StatelessWidget {
  final int correctCount;
  const ResultPage({super.key, required this.correctCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Container(
                width: 187,
                height: 187,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ManagerColors.inCircle, // Inner dark blue
                  border: Border.all(
                    color: ManagerColors.outCircle, // Outer border color
                    width: 6,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children:  [
                      Text(
                        'Your Score',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '$correctCount/30',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              "Congratulation",
              style: TextStyle(
                color: ManagerColors.inCircle,
                fontSize: ManagerFontSizes.s30,
                fontWeight: ManagerFontWeight.bold
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: 350,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate back to home here
                  Navigator.pushReplacementNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0E3F84), // Blue color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Back to Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            )

          ],
        ),
      )
      ,
    );
  }
}
