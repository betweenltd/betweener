import 'package:betweener/providers/followers_provider.dart';
import 'package:betweener/views/auth/login_view.dart';
import 'package:betweener/views/main_app/main_app_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingView extends StatelessWidget {
  static String id = '/loadingView';
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<FollowersProvider>(context, listen: false).getFollowersCount();

    return Consumer<FollowersProvider>(
      builder: (context, followerProvider, child) {
        if (followerProvider.state == FollowersProviderState.loaded) {
          return const MainAppView();
        } else if (followerProvider.state == FollowersProviderState.error) {
          return LoginView();
        } else {
          return Scaffold(
            backgroundColor: const Color(0xfff9f7f1),
            body: Center(
              child: Image.network(
                'https://media.licdn.com/dms/image/C4D12AQEdJXsL67ARZg/article-inline_image-shrink_1000_1488/0/1575562896158?e=1694044800&v=beta&t=OeLT3EbYHDd1rPGrwQ362nDIsFV4gmMwv9AI2UmvQY4',
                width: 250,
              ),
            ),
          );
        }
      },
    );
  }
}
