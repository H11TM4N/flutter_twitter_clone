import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_twitter_clone/core/utils.dart';
import 'package:flutter_twitter_clone/logic/apis/auth_api/auth_api.dart';

final authControllerProvider =
    StateNotifierProvider<AuthConroller, bool>((ref) {
  return AuthConroller(
    authApi: ref.watch(authAPIProvider),
  );
});

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
    ); //* left = onFailure , right = onSuccess
    state = false;
    response.fold(
      (left) => showSnackBar(context, left.message),
      (right) {
        showSnackBar(context, 'Account created. Kindly login');
      },
    );
  }

  void signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final response = await _authApi.signIn(
      email: email,
      password: password,
    ); //* left = onFailure , right = onSuccess
    state = false;
    response.fold(
      (left) => showSnackBar(context, left.message),
      (right) => print(right.userId),
    );
  }
}
