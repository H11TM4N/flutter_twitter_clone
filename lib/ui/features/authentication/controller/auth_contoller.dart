import 'package:appwrite/models.dart' as model;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_twitter_clone/core/utils.dart';
import 'package:flutter_twitter_clone/logic/apis/auth_api/auth_api.dart';
import 'package:flutter_twitter_clone/logic/apis/auth_api/user_api.dart';
import 'package:flutter_twitter_clone/src/models/user.dart';
import 'package:flutter_twitter_clone/ui/features/home/view/home_view.dart';

final authControllerProvider =
    StateNotifierProvider<AuthConroller, bool>((ref) {
  return AuthConroller(
    authApi: ref.watch(authAPIProvider),
    userApi: ref.watch(userApiProvider),
  );
});

final currentUserAccountProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.currentUser();
});

final currentUserDetailsProvider = FutureProvider((ref) async {
  final currentUserId = ref.watch(currentUserAccountProvider).value!.$id;
  final userDetails = ref.watch(userDetailsProvider(currentUserId));
  return userDetails.value;
});

final userDetailsProvider = FutureProvider.family((ref, String uid) async {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getUserData(uid);
});

class AuthConroller extends StateNotifier<bool> {
  final AuthApi _authApi;
  final UserApi _userApi;
  AuthConroller({
    required AuthApi authApi,
    required UserApi userApi,
  })  : _authApi = authApi,
        _userApi = userApi,
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
      (right) async {
        AppWriteUser appWriteUser = AppWriteUser(
          email: email,
          name: getUserName(email),
          followers: const [],
          following: const [],
          profilePic: '',
          bannerPic: '',
          uid: right.$id,
          bio: '',
          isTwitterBlue: false,
        );
        final res = await _userApi.saveUserData(appWriteUser);
        res.fold(
          (l) => showSnackBar(context, l.message),
          (_) => showSnackBar(context, 'Account created. Kindly login'),
        );
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
      (right) => smoothNavigation(context, const HomeView()),
    );
  }

  Future<AppWriteUser> getUserData(String uid) async {
    final doc = await _userApi.getUserData(uid);
    final updatedUser = AppWriteUser.fromMap(doc.data);
    return updatedUser;
  }
}
