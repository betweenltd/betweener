import 'package:betweener/core/util/constants.dart';
import 'package:betweener/features/home/widgets/circle_check_indicator_widget.dart';
import 'package:betweener/features/home/widgets/qrcode_image_widget.dart';
import 'package:betweener/features/home/widgets/social_cards_list_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

  var widgetKey = GlobalKey();
  double oldSize = 200;

  void postFrameCallback(_) {
    var context = widgetKey.currentContext;
    if (context == null) return;

    double? newSize = context.size?.height;
    if (oldSize == newSize) return;
    print(newSize);
    oldSize = newSize!;
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleCheckIndicator(
          scaleTransition: _scaleTransition,
          progress: _progress,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
          child: const Text(
            'Hello, Ahmed!',
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 24,
                fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          key: widgetKey,
          child: Center(
            child: GestureDetector(
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
                size: oldSize,
              ),
            ),
          ),
        ),
        const Divider(
          thickness: 2,
          color: kPrimaryColor,
          indent: 50,
          endIndent: 50,
        ),
        SizedBox(
          height: 8,
        ),
        const SocialCardsListView(),
        SizedBox(
          height: 100,
        )
      ],
    );
  }
}
