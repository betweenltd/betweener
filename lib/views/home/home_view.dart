import 'package:betweener/core/util/assets.dart';
import 'package:betweener/core/util/constants.dart';
import 'package:betweener/views/home/widgets/custom_qr_border.dart';
import 'package:betweener/views/home/widgets/social_cards_list_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  static String id = '/homeView';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Spacer(),
          const Text(
            'Hello, Ahmed!',
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 28,
                fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          Stack(
            alignment: Alignment.center,
            children: [
              const CustomQrBorder(),
              Image.asset(
                AssetsData.qrImage,
                color: kPrimaryColor,
              )
            ],
          ),
          const Spacer(),
          const Divider(
            thickness: 2,
            color: kPrimaryColor,
            indent: 50,
            endIndent: 50,
          ),
          const Spacer(),
          const SocialCardsListView(),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
