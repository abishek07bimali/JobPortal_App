import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';
import '../services/firebase_service.dart';

class AuthRepository{
  CollectionReference<UserModel> userRef = FirebaseService.db.collection("users")
      .withConverter<UserModel>(
    fromFirestore: (snapshot, _) {
      return UserModel.fromFirebaseSnapshot(snapshot);
    },
    toFirestore: (model, _) => model.toJson(),
  );
  Future<UserCredential?> register(UserModel user) async {
    try {
      final response = await userRef
          .where("email", isEqualTo: user.email!).get();
      if (response.size != 0)
        throw Exception("E-mail already exists");
      UserCredential _uc = await FirebaseService.firebaseAuth
          .createUserWithEmailAndPassword(
          email: user.email!, password: user.password!);

      user.userId = _uc.user!.uid;
      user.fcmToken = "";
      // insert into firestore user table
      await FirebaseService.db.collection('users').add(user.toJson());
      return _uc;
    } catch (err) {
      rethrow;
    }
  }


  Future<UserCredential> login(String email, String password) async {
    try {
      UserCredential _uc = await FirebaseService.firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
           return _uc;
    } catch (err) {
      rethrow;
    }
  }

  Future<UserModel> getUserDetail(String id) async {
    try {
      final response = await userRef
          .where("id", isEqualTo: id).get();

      var user = response.docs.single.data();
      user.fcmToken="";
      await userRef.doc(user.userId).set(user);

      return user;
    } catch (err) {
      rethrow;
    }
  }



  Future<bool> resetPassword(String email) async {
    try {
      var res = await FirebaseService.firebaseAuth
          .sendPasswordResetEmail( email: email);
      return true;
    } catch (err) {
      rethrow;
    }
  }


  Future<void> logout() async {
    try {
      await FirebaseService.firebaseAuth.signOut();
    } catch (err) {
      rethrow;
    }
  }
}