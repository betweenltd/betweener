import 'package:betweener/core/util/shared_prefs.dart';
import 'package:betweener/providers/connectivity_provider.dart';
import 'package:betweener/providers/followers_provider.dart';
import 'package:betweener/views/auth/login_view.dart';
import 'package:betweener/views/auth/register_view.dart';
import 'package:betweener/views/home/home_view.dart';
import 'package:betweener/views/loading/loading_view.dart';
import 'package:betweener/views/main_app/main_app_view.dart';
import 'package:betweener/views/onbording/onbording_view.dart';
import 'package:betweener/views/profile/add_link_view.dart';
import 'package:betweener/views/profile/edit_link_view.dart';
import 'package:betweener/views/profile/edit_profile_view.dart';
import 'package:betweener/views/recieve/receive_view.dart';
import 'package:betweener/views/scan_qr/scan_qr_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/util/constants.dart';
import 'views/profile/profile_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsController().init();

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
        ChangeNotifierProvider<FollowersProvider>(
            create: (_) => FollowersProvider()),
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
          scaffoldBackgroundColor: kScaffoldColor,
        ),
        home: FutureBuilder<bool>(
          future: SharedPrefsController().shouldShowOnboarding(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data == true) {
              return const OnBoardingView();
            } else {
              return const LoadingView();
            }
          },
        ),
        routes: {
          LoadingView.id: (context) => const LoadingView(),
          LoginView.id: (context) => LoginView(),
          RegisterView.id: (context) => RegisterView(),
          HomeView.id: (context) => const HomeView(),
          MainAppView.id: (context) => const MainAppView(),
          ProfileView.id: (context) => const ProfileView(),
          ScanQrView.id: (context) => const ScanQrView(),
          EditProfileView.id: (context) => const EditProfileView(),
          EditLinkView.id: (context) => const EditLinkView(),
          AddLinkView.id: (context) => const AddLinkView(),
          ReceiveView.id: (context) => const ReceiveView(),
        },
      ),
    );
  }
}
