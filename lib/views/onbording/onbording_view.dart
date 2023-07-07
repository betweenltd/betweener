import 'package:betweener/core/util/assets.dart';
import 'package:betweener/core/util/constants.dart';
import 'package:betweener/core/util/shared_prefs.dart';
import 'package:betweener/core/widgets/secondary_button_widget.dart';
import 'package:betweener/views/loading/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(),
            SvgPicture.asset(AssetsData.onBoardingImage),
            const Text(
              'Just one Scan for everything',
              style: TextStyle(
                  fontSize: 16,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            SecondaryButtonWidget(
              text: 'Get Started',
              width: double.infinity,
              onTap: () {
                SharedPrefsController().setOnboardingShown();
                Navigator.pushNamed(context, LoadingView.id);
              },
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
