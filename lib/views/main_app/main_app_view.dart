import 'package:betweener/core/util/constants.dart';
import 'package:betweener/views/home/home_view.dart';
import 'package:betweener/views/main_app/widgets/custom_floating_nav_bar.dart';
import 'package:betweener/views/profile/profile_view.dart';
import 'package:betweener/views/scan_qr/scan_qr_view.dart';
import 'package:flutter/material.dart';

class AppView extends StatefulWidget {
  static String id = '/appView';

  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  int _currentIndex = 1;

  List<Widget?> screensList = [
    const ScanQrView(),
    const HomeView(),
    const ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
