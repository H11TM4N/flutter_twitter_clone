import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_twitter_clone/logic/apis/auth_api/auth_api.dart';

class AuthConroller extends StateNotifier<bool> {
  final AuthApi _authApi;
  AuthConroller({required AuthApi authApi})
      : _authApi = authApi,
        super(false);

  void signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final response = await _authApi.signUp(
      email: email,
      password: password,
    );
    response.fold((left) => null, (right) => print(right.name));
  }
}
