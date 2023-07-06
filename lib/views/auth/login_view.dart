import 'package:betweener/core/util/assets.dart';
import 'package:betweener/core/widgets/custom_labeled_textfield_widget.dart';
import 'package:betweener/core/widgets/primary_outlined_button_widget.dart';
import 'package:betweener/core/widgets/secondary_button_widget.dart';
import 'package:betweener/views/auth/register_view.dart';
import 'package:betweener/views/main_app/main_app_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/google_button_widget.dart';

class LoginView extends StatelessWidget {
  static String id = '/loginView';

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const Spacer(),
                SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                    child: Hero(
                        tag: 'authImage',
                        child: SvgPicture.asset(AssetsData.authImage))),
                const Spacer(),
                PrimaryLabeledTextFieldWidget(
                  controller: TextEditingController(),
                  hint: 'example@gmail.com',
                  label: 'Email',
                ),
                const SizedBox(
                  height: 14,
                ),
                PrimaryLabeledTextFieldWidget(
                  controller: TextEditingController(),
                  hint: 'Enter password',
                  label: 'password',
                  password: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                SecondaryButtonWidget(
                    onTap: () {
                      Navigator.pushNamed(context, AppView.id);
                    },
                    text: 'LOGIN'),
                const SizedBox(
                  height: 24,
                ),
                PrimaryOutlinedButtonWidget(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterView.id);
                    },
                    text: 'REGISTER'),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  '-  or  -',
                  style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 12,
                ),
                GoogleButtonWidget(onTap: () {}),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
