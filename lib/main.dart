import 'package:betweener/providers/connectivity_provider.dart';
import 'package:betweener/views/auth/login_view.dart';
import 'package:betweener/views/auth/register_view.dart';
import 'package:betweener/views/home/home_view.dart';
import 'package:betweener/views/main_app/main_app_view.dart';
import 'package:betweener/views/onbording/onbording_view.dart';
import 'package:betweener/views/profile/add_link_view.dart';
import 'package:betweener/views/profile/edit_link_view.dart';
import 'package:betweener/views/profile/edit_profile_view.dart';
import 'package:betweener/views/scan_qr/scan_qr_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/util/constants.dart';
import 'views/profile/profile_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyConnectivity>(
          create: (_) => MyConnectivity(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Betweener',
        theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: kPrimaryColor,
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor),
            ),
            scaffoldBackgroundColor: kScaffoldColor),
        routes: {
          '/': (context) => const OnBoardingView(),
          LoginView.id: (context) => const LoginView(),
          RegisterView.id: (context) => const RegisterView(),
          HomeView.id: (context) => const HomeView(),
          AppView.id: (context) => const AppView(),
          ProfileView.id: (context) => const ProfileView(),
          ScanQrView.id: (context) => const ScanQrView(),
          EditProfileView.id: (context) => const EditProfileView(),
          EditLinkView.id: (context) => const EditLinkView(),
          AddLinkView.id: (context) => const AddLinkView(),
        },
      ),
    );
  }
}
