import 'package:betweener/core/util/constants.dart';
import 'package:betweener/views/profile/edit_link_view.dart';
import 'package:betweener/views/profile/widgets/links_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class LinksListView extends StatelessWidget {
  const LinksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SlidableAutoCloseBehavior(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 11,
        itemBuilder: (context, index) {
          Color cardBackgroundColor;
          Color titleColor;
          Color linkColor;

          switch (index % 2) {
            case 0:
              {
                cardBackgroundColor = kLightDangerColor;
                titleColor = kOnLightDangerColor;
                linkColor = const Color(0xff9B6A73);
              }
              break;
            case 1:
              {
                cardBackgroundColor = const Color(0xffE7E5F1);
                titleColor = kPrimaryColor;
                linkColor = kLightPrimaryColor;
              }
              break;
            default:
              {
                cardBackgroundColor = kLightDangerColor;
                titleColor = kOnLightDangerColor;
                linkColor = const Color(0xff9B6A73);
              }
          }
          return LinksListItem(
            index: index,
            deleteFunction: (context) {},
            editFunction: (context) {
              Navigator.pushNamed(context, EditLinkView.id);
            },
            cardBackgroundColor: cardBackgroundColor,
            titleColor: titleColor,
            linkColor: linkColor,
          );
        },
      ),
    );
  }
}
