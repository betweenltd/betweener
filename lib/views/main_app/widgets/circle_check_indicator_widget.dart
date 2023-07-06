import 'package:flutter/material.dart';

import '../../../core/util/constants.dart';

class CircleCheckIndicator extends StatelessWidget {
  final Animation<double> scaleTransition;
  final double progress;

  const CircleCheckIndicator(
      {super.key, required this.scaleTransition, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: scaleTransition.value * 30,
        height: scaleTransition.value * 30,
        decoration: BoxDecoration(
            color: scaleTransition.value == 1
                ? Colors.green.shade200
                : Colors.white,
            shape: BoxShape.circle),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.check,
              size: scaleTransition.value * 24,
            ),
            CircularProgressIndicator(
              value: progress,
              backgroundColor: Colors.black26,
              valueColor: const AlwaysStoppedAnimation<Color>(
                kPrimaryColor, //<-- SEE HERE
              ),
            ),
          ],
        ),
      ),
    );
  }
}
