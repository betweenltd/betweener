import 'package:betweener/core/util/assets.dart';
import 'package:betweener/core/util/constants.dart';
import 'package:betweener/views/home/widgets/custom_qr_border.dart';
import 'package:flutter/material.dart';

class QrCodeImageWidget extends StatelessWidget {
  final double scale;
  final double size;

  const QrCodeImageWidget({super.key, required this.scale, required this.size});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CustomQrBorder(0),
      size: Size(size, size),
      child: AnimatedScale(
        scale: scale,
        duration: const Duration(milliseconds: 500),
        child: Image.asset(
          AssetsData.qrImage,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
