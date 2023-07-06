import 'package:betweener/views/profile/edit_profile_view.dart';
import 'package:betweener/views/profile/widgets/links_list_view.dart';
import 'package:betweener/views/profile/widgets/profile_card_widget.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  static const id = '/profileView';

  final bool Function(UserScrollNotification)? onNotification;

  const ProfileView({super.key, this.onNotification});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<UserScrollNotification>(
      onNotification: onNotification,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38),
              child: Column(
                children: [
                  ProfileCardWidget(
                    name: 'John Doe',
                    email: 'example@gmail.com',
                    phoneNumber: '+9700000000',
                    editOnTap: () {
                      Navigator.pushNamed(context, EditProfileView.id);
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 38),
              child: LinksListView(),
            ),
          )
        ],
      ),
    );
  }
}
