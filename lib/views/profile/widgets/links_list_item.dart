import 'package:betweener/core/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class LinksListItem extends StatelessWidget {
  final Color cardBackgroundColor;
  final Color titleColor;
  final Color linkColor;
  final int index;
  final Function(BuildContext context) deleteFunction;
  final Function(BuildContext context) editFunction;

  const LinksListItem(
      {super.key,
      required this.cardBackgroundColor,
      required this.titleColor,
      required this.linkColor,
      required this.index,
      required this.deleteFunction,
      required this.editFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Slidable(
        key: ValueKey(index),
        groupTag: '0',
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            const SizedBox(
              width: 12,
            ),
            SlidableAction(
              borderRadius: BorderRadius.circular(12),
              // An action can be bigger than the others.
              onPressed: editFunction,
              backgroundColor: kSecondaryColor,
              foregroundColor: Colors.white,
              padding: EdgeInsets.zero,
              icon: Icons.edit,
            ),
            const SizedBox(
              width: 12,
            ),
            SlidableAction(
              borderRadius: BorderRadius.circular(12),
              onPressed: deleteFunction,
              backgroundColor: kDangerColor,
              padding: EdgeInsets.zero,
              foregroundColor: Colors.white,
              icon: Icons.delete,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(14),
          width: double.infinity,
          decoration: BoxDecoration(
            color: cardBackgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'INSTAGRAM',
                style: TextStyle(
                    fontSize: 14, color: titleColor, letterSpacing: 3),
              ),
              Text('https://instagram.com/a7medhq',
                  style: TextStyle(fontSize: 14, color: linkColor))
            ],
          ),
        ),
      ),
    );
  }
}
