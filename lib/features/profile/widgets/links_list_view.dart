import 'package:betweener/core/util/api_response.dart';
import 'package:betweener/core/util/constants.dart';
import 'package:betweener/providers/links_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../../models/link_model.dart';
import '../links/edit_link_view.dart';
import 'links_list_item.dart';

class LinksListView extends StatelessWidget {
  const LinksListView({super.key});

  @override
  Widget build(BuildContext context) {
    ApiResponse<List<Link>> _links =
        Provider.of<LinkProvider>(context).linkList;
    if (_links.status == Status.LOADING) {
      return Center(child: CircularProgressIndicator());
    }
    if (_links.status == Status.ERROR) {
      return Center(
        child: Text('${_links.message}'),
      );
    }

    return SlidableAutoCloseBehavior(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _links.data?.length,
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
                linkColor = kLinksColor;
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
