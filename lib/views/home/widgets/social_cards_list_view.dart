import 'package:betweener/views/home/widgets/social_cards_item.dart';
import 'package:flutter/material.dart';

class SocialCardsListView extends StatelessWidget {
  const SocialCardsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: SocialCardsItem(),
        ),
        itemCount: 10,
      ),
    );
  }
}
