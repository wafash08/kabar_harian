import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kabar_harian/data/repositories/user_repository.dart';
import 'package:kabar_harian/domain/entities/result.dart';
import 'package:kabar_harian/domain/entities/user.dart';
import 'package:path/path.dart';

class FirebaseUserRepository implements UserRepository {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseUserRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<Result<User>> createUser(
      {required String uid,
      required String email,
      required String name,
      String? photoUrl}) async {
    try {
      CollectionReference<Map<String, dynamic>> users =
          _firebaseFirestore.collection('users');

      await users.doc(uid).set({
        'uid': uid,
        'email': email,
        'name': name,
        'photoUrl': photoUrl,
      });

      DocumentSnapshot<Map<String, dynamic>> result =
          await users.doc(uid).get();

      if (result.exists) {
        var userData = result.data()!;

        return Result.success(User.fromJson(userData));
      } else {
        return const Result.failed('Failed to create user data');
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<User>> getUser({required String uid}) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        _firebaseFirestore.doc('users/$uid');

    DocumentSnapshot<Map<String, dynamic>> result =
        await documentReference.get();

    if (result.exists) {
      return Result.success(User.fromJson(result.data()!));
    } else {
      return const Result.failed('User is not found');
    }
  }

  @override
  Future<Result<User>> updateUser({required User user}) async {
    try {
      DocumentReference<Map<String, dynamic>> documentReference =
          _firebaseFirestore.doc('users/${user.uid}');

      await documentReference.update(user.toJson());

      DocumentSnapshot<Map<String, dynamic>> result =
          await documentReference.get();

      if (result.exists) {
        User updatedUser = User.fromJson(result.data()!);

        if (updatedUser == user) {
          return Result.success(updatedUser);
        } else {
          return const Result.failed('Failed to update user data');
        }
      } else {
        return const Result.failed('Failed to update user data');
      }
    } on FirebaseException catch (e) {
      return Result.failed(e.message ?? 'Failed to update user data');
    }
  }

  @override
  Future<Result<User>> uploadProfilePicture(
      {required User user, required File image}) async {
    String filename = basename(image.path);
    Reference reference = FirebaseStorage.instance.ref().child(filename);

    try {
      await reference.putFile(image);
      String downloadUrl = await reference.getDownloadURL();
      var updatedResult =
          await updateUser(user: user.copyWith(photoUrl: downloadUrl));

      if (updatedResult.isSuccess) {
        return Result.success(updatedResult.resultValue!);
      } else {
        return Result.failed(updatedResult.errorMessage!);
      }
    } catch (e) {
      return const Result.failed('Failed to upload profile picture');
    }
  }
}
