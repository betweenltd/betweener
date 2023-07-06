import 'package:betweener/core/util/assets.dart';
import 'package:betweener/core/util/constants.dart';
import 'package:betweener/views/home/widgets/circle_check_indicator_widget.dart';
import 'package:betweener/views/home/widgets/custom_qr_border.dart';
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

        if (_scaleTransition.value == 1) {
          HapticFeedback.heavyImpact();
        }
        if (_progress == 1) {
          _scaleTransition.removeListener(() {});
          _controller.stop();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello, Ahmed!',
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              GestureDetector(
                onTapDown: (details) {
                  setState(() => scale = scale == 1.0 ? 1.15 : 1.0);
                  _controller.forward();
                },
                onTapUp: (TapUpDetails details) {
                  setState(() => scale = scale == 1.15 ? 1.0 : 1.15);
                  _controller.reverse();
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const CustomQrBorder(),
                    AnimatedScale(
                      scale: scale,
                      duration: const Duration(milliseconds: 500),
                      child: Image.asset(
                        AssetsData.qrImage,
                        color: kPrimaryColor,
                      ),
                    )
                  ],
                ),
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
                flex: 4,
              ),
            ],
          ),
          CircleCheckIndicator(
            scaleTransition: _scaleTransition,
            progress: _progress,
          )
        ],
      ),
    );
  }
}
