import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_twitter_clone/core/core.dart';
import 'package:flutter_twitter_clone/core/providers.dart';
import 'package:fpdart/fpdart.dart';

final authAPIProvider = Provider((ref) {
  final account = ref.watch(appwriteAccountProvider);
  return AuthApi(account: account);
});

abstract class IAuthApi {
  FutureEither<model.User> signUp({
    required String email,
    required String password,
  });

  FutureEither<model.Session> signIn({
    required String email,
    required String password,
  });

  Future<model.User?> currentUserAccount();
}

class AuthApi implements IAuthApi {
  final Account _account;
  AuthApi({required Account account}) : _account = account;

  @override
  Future<model.User?> currentUserAccount() async {
    try {
      return await _account.get();
    } on AppwriteException {
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  FutureEither<model.User> signUp(
      {required String email, required String password}) async {
    try {
      final account = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );
      return right(account);
    } on AppwriteException catch (e, stackTrace) {
      return left(
          Failure(e.message ?? 'An unexpected error occured', stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

  @override
  FutureEither<model.Session> signIn(
      {required String email, required String password}) async {
    try {
      final account = await _account.createEmailSession(
        email: email,
        password: password,
      );
      return right(account);
    } on AppwriteException catch (e, stackTrace) {
      return left(
          Failure(e.message ?? 'An unexpected error occured', stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}
