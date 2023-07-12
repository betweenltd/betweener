import 'package:betweener/core/util/constants.dart';
import 'package:betweener/features/home/home_view.dart';
import 'package:betweener/features/main_app/widgets/custom_floating_nav_bar.dart';
import 'package:betweener/features/profile/profile_view.dart';
import 'package:betweener/features/scan_qr/scan_qr_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../profile/links/add_link_view.dart';
import '../recieve/receive_view.dart';

class MainAppView extends StatefulWidget {
  static String id = '/mainAppView';

  const MainAppView({super.key});

  @override
  State<MainAppView> createState() => _MainAppViewState();
}

class _MainAppViewState extends State<MainAppView> {
  int _currentIndex = 0;
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
    const HomeView(),
    const ReceiveView(),
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
            : _currentIndex == 1
                ? const Text(
                    'Receive',
                  )
                : _currentIndex == 0
                    ? const Text(
                        'Betweener',
                      )
                    : null,
        centerTitle: _currentIndex == 0 ? false : true,
        actions: [
          if (_currentIndex == 0) ...[
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: kPrimaryColor,
                size: 32,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, ScanQrView.id);
              },
              icon: const Icon(
                Icons.qr_code,
                color: kPrimaryColor,
                size: 32,
              ),
            ),
          ]
        ],
        elevation: 0,
        backgroundColor: kScaffoldColor,
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
