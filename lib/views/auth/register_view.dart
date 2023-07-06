import 'package:betweener/core/util/assets.dart';
import 'package:betweener/core/widgets/custom_labeled_textfield.dart';
import 'package:betweener/core/widgets/secondary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/google_button_widget.dart';

class RegisterView extends StatelessWidget {
  static String id = '/registerView';

  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          //replace with our own icon data.
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                AppBar().preferredSize.height,
            child: Column(
              children: [
                const Spacer(),
                SizedBox(
                    height: MediaQuery.of(context).size.height / 8,
                    child: Hero(
                        tag: 'authImage',
                        child: SvgPicture.asset(AssetsData.authImage))),
                const SizedBox(
                  height: 24,
                ),
                PrimaryLabeledTextField(
                  controller: TextEditingController(),
                  hint: 'John Doe',
                  label: 'Name',
                ),
                const SizedBox(
                  height: 14,
                ),
                PrimaryLabeledTextField(
                  controller: TextEditingController(),
                  hint: 'example@gmail.com',
                  label: 'Email',
                ),
                const SizedBox(
                  height: 14,
                ),
                PrimaryLabeledTextField(
                  controller: TextEditingController(),
                  hint: 'Enter password',
                  label: 'password',
                  password: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                SecondaryButtonWidget(onTap: () {}, text: 'REGISTER'),
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
