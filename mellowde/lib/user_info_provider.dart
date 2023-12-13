import 'package:flutter/material.dart';
import 'models/user_info.dart';

class UserInfoProvider extends ChangeNotifier {
  UserInfo? _userInfo;

  UserInfo? get userInfo => _userInfo;

  void setUserInfo(UserInfo userInfo) {
    _userInfo = userInfo;
    notifyListeners();
  }
}