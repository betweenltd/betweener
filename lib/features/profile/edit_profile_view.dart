import 'package:betweener/core/util/constants.dart';
import 'package:betweener/core/widgets/custom_labeled_textfield_widget.dart';
import 'package:betweener/core/widgets/secondary_button_widget.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  static const id = '/editProfileView';
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          //replace with our own icon data.
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          children: [
            Hero(
              tag: 'profilePic',
              child: CircleAvatar(
                backgroundColor: kPrimaryColor,
                radius: size.width / 4,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const PrimaryLabeledTextFieldWidget(label: 'name'),
            const SizedBox(
              height: 12,
            ),
            const PrimaryLabeledTextFieldWidget(label: 'email'),
            const SizedBox(
              height: 12,
            ),
            const PrimaryLabeledTextFieldWidget(label: 'phone'),
            const Spacer(),
            SecondaryButtonWidget(
              onTap: () {},
              text: 'SAVE',
              width: size.width / 3,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
