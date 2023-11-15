import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_twitter_clone/core/core.dart';
import 'package:flutter_twitter_clone/core/providers.dart';
import 'package:flutter_twitter_clone/src/models/user.dart';
import 'package:fpdart/fpdart.dart';

import '../../../data/constants/costants.dart';

final userApiProvider = Provider<UserApi>((ref) {
  return UserApi(db: ref.watch(appwriteDatabaseProvider));
});

abstract class IUserAPI {
  FutureEitherVoid saveUserData(AppWriteUser appWriteUser);
  Future<Document> getUserData(String id);
}

class UserApi implements IUserAPI {
  final Databases _db;
  UserApi({required Databases db}) : _db = db;
  @override
  FutureEitherVoid saveUserData(AppWriteUser appWriteUser) async {
    try {
      await _db.createDocument(
        databaseId: AppwrieConstants.databaseID,
        collectionId: AppwrieConstants.userCollectionId,
        documentId: appWriteUser.uid,
        data: appWriteUser.toMap(),
      );
      return right(null);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(e.message ?? 'An Unexpected error occured', stackTrace),
      );
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }

  @override
  Future<Document> getUserData(String uid) {
    return _db.getDocument(
      databaseId: AppwrieConstants.databaseID,
      collectionId: AppwrieConstants.userCollectionId,
      documentId: uid,
    );
  }
}
