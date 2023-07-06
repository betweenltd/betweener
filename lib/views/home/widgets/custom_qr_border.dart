import 'package:betweener/core/util/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CustomQrBorder extends StatelessWidget {
  const CustomQrBorder({super.key});

  @override
  Widget build(BuildContext context) {
    Path customPath = Path()
      ..moveTo(0, 0)
      ..lineTo(0, (MediaQuery.of(context).size.width - 64) / 4)
      ..moveTo(0, 0)
      ..lineTo((MediaQuery.of(context).size.width - 64) / 4, 0)
      ..moveTo((MediaQuery.of(context).size.width - 64) / 4 * 3, 0)
      ..lineTo(MediaQuery.of(context).size.width - 64, 0)
      ..lineTo(MediaQuery.of(context).size.width - 64,
          (MediaQuery.of(context).size.width - 64) / 4)
      ..moveTo(0, (MediaQuery.of(context).size.width - 64) / 4 * 3)
      ..lineTo(0, MediaQuery.of(context).size.width - 64)
      ..lineTo((MediaQuery.of(context).size.width - 64) / 4,
          MediaQuery.of(context).size.width - 64)
      ..moveTo(MediaQuery.of(context).size.width - 64,
          (MediaQuery.of(context).size.width - 64) / 4 * 3)
      ..lineTo(MediaQuery.of(context).size.width - 64,
          MediaQuery.of(context).size.width - 64)
      ..lineTo((MediaQuery.of(context).size.width - 64) / 4 * 3,
          MediaQuery.of(context).size.width - 64);
    return DottedBorder(
      customPath: (_) => customPath,
      color: kLightPrimaryColor,
      dashPattern: const [1, 1],
      strokeWidth: 2,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          width: double.infinity,
          color: Colors.green.withAlpha(20),
        ),
      ),
    );
  }
}
