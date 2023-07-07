import 'package:betweener/core/util/constants.dart';
import 'package:betweener/views/home/widgets/circle_check_indicator_widget.dart';
import 'package:betweener/views/home/widgets/qrcode_image_widget.dart';
import 'package:betweener/views/home/widgets/social_cards_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeView extends StatefulWidget {
  static String id = '/homeView';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  double scale = 1.0;
  late AnimationController _controller;
  late Animation<double> _scaleTransition;
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleTransition = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {
          _progress = _scaleTransition.value;
        });

        if (_progress == 1) {
          HapticFeedback.heavyImpact();
          _scaleTransition.removeListener(() {});
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleCheckIndicator(
            scaleTransition: _scaleTransition,
            progress: _progress,
          ),
          const Text(
            'Hello, Ahmed!',
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 28,
                fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          GestureDetector(
              onTap: () {},
              onLongPress: () {
                setState(() => scale = scale == 1.0 ? 1.15 : 1.0);
                _controller.forward();
              },
              onLongPressUp: () {
                setState(() => scale = scale == 1.15 ? 1.0 : 1.15);
                _controller.reverse();
              },
              child: QrCodeImageWidget(
                scale: scale,
              )),
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
            flex: 4,
          ),
        ],
      ),
    );
  }
}
