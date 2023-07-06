import 'package:betweener/core/util/constants.dart';
import 'package:betweener/views/home/home_view.dart';
import 'package:betweener/views/main_app/widgets/custom_floating_nav_bar.dart';
import 'package:betweener/views/profile/add_link_view.dart';
import 'package:betweener/views/profile/profile_view.dart';
import 'package:betweener/views/scan_qr/scan_qr_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AppView extends StatefulWidget {
  static String id = '/appView';

  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  int _currentIndex = 1;
  bool isFabVisible = true;

  bool onNotification(UserScrollNotification notification) {
    if (notification.direction == ScrollDirection.forward) {
      if (!isFabVisible) {
        setState(() {
          isFabVisible = true;
        });
      }
    }
    if (notification.direction == ScrollDirection.reverse) {
      if (isFabVisible) {
        setState(() {
          isFabVisible = false;
        });
      }
    }

    return true;
  }

  late List<Widget?> screensList = [
    const ScanQrView(),
    const HomeView(),
    ProfileView(
      onNotification: onNotification,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: _currentIndex == 2
            ? const Text(
                'Profile',
              )
            : null,
        centerTitle: true,
        actions: [
          if (_currentIndex == 1) ...[
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: kPrimaryColor,
                size: 32,
              ),
            ),
          ]
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: screensList[_currentIndex],
      extendBody: true,
      floatingActionButton: _currentIndex == 2 && isFabVisible
          ? FloatingActionButton(
              shape: const CircleBorder(),
              elevation: 0,
              backgroundColor: kPrimaryColor,
              onPressed: () {
                Navigator.pushNamed(context, AddLinkView.id);
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          : null,
      bottomNavigationBar: CustomFloatingNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
