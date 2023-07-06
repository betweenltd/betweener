import 'package:betweener/core/util/constants.dart';
import 'package:flutter/material.dart';

class SocialCardsItem extends StatelessWidget {
  const SocialCardsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 116,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
          color: kLightSecondaryColor, borderRadius: BorderRadius.circular(12)),
      child: const Column(
        children: [
          Text(
            'Facebook',
            style: TextStyle(
                color: kOnSecondaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          Text(
            '@A7medhq',
            style: TextStyle(
                color: kOnSecondaryColor,
                fontSize: 13,
                fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
