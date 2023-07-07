import 'package:betweener/core/util/assets.dart';
import 'package:betweener/core/util/constants.dart';
import 'package:betweener/views/home/widgets/custom_qr_border.dart';
import 'package:flutter/material.dart';

class QrCodeImageWidget extends StatelessWidget {
  final double scale;

  const QrCodeImageWidget({super.key, required this.scale});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const CustomQrBorder(padding: 32),
        AnimatedScale(
          scale: scale,
          duration: const Duration(milliseconds: 500),
          child: Image.asset(
            AssetsData.qrImage,
            color: kPrimaryColor,
          ),
        )
      ],
    );
  }
}
