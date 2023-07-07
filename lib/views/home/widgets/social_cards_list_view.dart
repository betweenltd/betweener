import 'package:betweener/core/util/constants.dart';
import 'package:betweener/views/home/widgets/social_cards_item.dart';
import 'package:flutter/material.dart';

class SocialCardsListView extends StatelessWidget {
  const SocialCardsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ShaderMask(
        shaderCallback: (Rect rect) {
          return const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.white,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.white
            ],
            stops: [
              0.0,
              0.1,
              0.1,
              0.9,
              1.0
            ], // 10% purple, 80% transparent, 10% purple
          ).createShader(rect);
        },
        blendMode: BlendMode.dstOut,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (index == 9) {
              return const Padding(
                padding: EdgeInsets.only(left: 12.0, right: 24),
                child: SocialCardsItem(
                    color: kLightPrimaryColor,
                    title: 'Add More',
                    icon: Icons.add,
                    contentColor: kPrimaryColor),
              );
            }
            if (index == 0) {
              return const Padding(
                padding: EdgeInsets.only(left: 24, right: 12),
                child: SocialCardsItem(
                    color: kLightSecondaryColor,
                    title: 'FaceBook',
                    user: '@A7medhq',
                    contentColor: kOnSecondaryColor),
              );
            }
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: SocialCardsItem(
                  color: kLightSecondaryColor,
                  title: 'FaceBook',
                  user: '@A7medhq',
                  contentColor: kOnSecondaryColor),
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
