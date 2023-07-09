import 'package:betweener/core/util/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CustomQrBorder extends CustomPainter {
  final int padding;
  CustomQrBorder(this.padding);

  //  @override
  //  Widget build(BuildContext context) {
  // return DottedBorder(
  //      customPath: (_) => customPath,
  //      color: kLinksColor,
  //      dashPattern: const [1, 1],
  //      strokeWidth: 2,
  //      child: AspectRatio(
  //        aspectRatio: 1,
  //        child: Container(
  //          width: double.infinity,
  //          color: Colors.green.withAlpha(20),
  //        ),
  //      ),
  //    );
  //  }

  @override
  void paint(Canvas canvas, Size size) {
    Path customPath = Path()
      ..moveTo(0, 0)
      ..lineTo(0, (size.width - padding * 2) / 4)
      ..moveTo(0, 0)
      ..lineTo((size.width - padding * 2) / 4, 0)
      ..moveTo((size.width - padding * 2) / 4 * 3, 0)
      ..lineTo(size.width - padding * 2, 0)
      ..lineTo(size.width - padding * 2, (size.width - padding * 2) / 4)
      ..moveTo(0, (size.width - padding * 2) / 4 * 3)
      ..lineTo(0, size.width - padding * 2)
      ..lineTo((size.width - padding * 2) / 4, size.width - padding * 2)
      ..moveTo(size.width - padding * 2, (size.width - padding * 2) / 4 * 3)
      ..lineTo(size.width - padding * 2, size.width - padding * 2)
      ..lineTo((size.width - padding * 2) / 4 * 3, size.width - padding * 2);
    canvas.drawPath(customPath, Paint()..style = PaintingStyle.stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
