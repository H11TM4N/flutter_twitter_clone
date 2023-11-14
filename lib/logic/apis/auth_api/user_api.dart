import 'package:flutter_twitter_clone/core/core.dart';

abstract class IUserAPI {
  FutureEitherVoid saveUserData();
}

class UserApi implements IUserAPI {
  @override
  FutureEitherVoid saveUserData() {
    // TODO: implement saveUserData
    throw UnimplementedError();
  }
}