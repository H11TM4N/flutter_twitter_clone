import 'package:appwrite/models.dart' as model;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_twitter_clone/core/utils.dart';
import 'package:flutter_twitter_clone/logic/apis/auth_api/auth_api.dart';
import 'package:flutter_twitter_clone/ui/features/home/view/home_view.dart';

final authControllerProvider =
    StateNotifierProvider<AuthConroller, bool>((ref) {
  return AuthConroller(
    authApi: ref.watch(authAPIProvider),
  );
});

final currentUserAccountProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.currentUser();
});

class AuthConroller extends StateNotifier<bool> {
  final AuthApi _authApi;
  AuthConroller({required AuthApi authApi})
      : _authApi = authApi,
        super(false);

  Future<model.User?> currentUser() => _authApi.currentUserAccount();

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
      (right) => kNavigation(context, const HomeView()),
    );
  }
}
