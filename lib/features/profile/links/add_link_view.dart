import 'package:betweener/core/widgets/custom_labeled_textfield_widget.dart';
import 'package:betweener/core/widgets/secondary_button_widget.dart';
import 'package:flutter/material.dart';

class AddLinkView extends StatelessWidget {
  static const id = '/addLinkView';
  const AddLinkView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Link"),
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
            const PrimaryLabeledTextFieldWidget(label: 'title'),
            const SizedBox(
              height: 12,
            ),
            const PrimaryLabeledTextFieldWidget(label: 'link'),
            const SizedBox(
              height: 48,
            ),
            SecondaryButtonWidget(
              onTap: () {},
              text: 'ADD',
              width: size.width / 3,
            ),
          ],
        ),
      ),
    );
  }
}
