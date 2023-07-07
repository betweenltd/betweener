import 'package:flutter/material.dart';

class SocialCardsItem extends StatelessWidget {
  final Color color;
  final Color contentColor;
  final String title;
  final String? user;
  final IconData? icon;

  const SocialCardsItem(
      {super.key,
      required this.color,
      required this.title,
      this.user,
      this.icon,
      required this.contentColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 116,
      padding: const EdgeInsets.all(16),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
                color: contentColor, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          if (user != null)
            Text(
              user!,
              style: TextStyle(
                  color: contentColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w300),
            ),
          if (icon != null)
            Icon(
              icon!,
              color: contentColor,
            ),
        ],
      ),
    );
  }
}
