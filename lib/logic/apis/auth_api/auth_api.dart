import 'package:appwrite/appwrite.dart';
import 'package:flutter_twitter_clone/core/core.dart';

abstract class IAuthApi {
  FutureEither<Account> signUp({
    required String email,
    required String password,
  });
}

// class AuthApi implements IAuthApi {}
