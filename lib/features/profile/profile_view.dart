import 'package:betweener/features/profile/widgets/links_list_view.dart';
import 'package:betweener/features/profile/widgets/profile_card_widget.dart';
import 'package:betweener/services/follow_service.dart';
import 'package:flutter/material.dart';

import 'edit_profile_view.dart';

class ProfileView extends StatefulWidget {
  static const id = '/profileView';

  final bool Function(UserScrollNotification)? onNotification;

  const ProfileView({super.key, this.onNotification});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String? followers;

  getFollowersCount() {
    FollowServices.getFollowersCount().then((value) {
      if (mounted) {
        setState(() {
          followers = value.toString();
        });
      }
    });
  }

  @override
  void initState() {
    followers = getFollowersCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<UserScrollNotification>(
      onNotification: widget.onNotification,
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
                    followersCount: '$followers',
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
