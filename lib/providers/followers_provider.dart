import 'package:betweener/services/follow_service.dart';
import 'package:flutter/material.dart';

enum FollowersProviderState { initial, loading, loaded, error }

class FollowersProvider extends ChangeNotifier {
  FollowersProviderState _state = FollowersProviderState.initial;
  FollowersProviderState get state => _state;

  int? _followersCount;
  int? get followersCount => _followersCount;

  FollowersProvider() {
    getFollowersCount();
  }

  void getFollowersCount() async {
    _state = FollowersProviderState.loading;

    try {
      final res = await FollowServices.getFollowersCount();
      _followersCount = res;
      _state = FollowersProviderState.loaded;
    } catch (e) {
      _state = FollowersProviderState.error;
    }

    notifyListeners();
  }
}
