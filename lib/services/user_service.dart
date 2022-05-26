import 'package:airplane_apps/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  // * CREATE OBJECT COLLECTION
  CollectionReference _userReferences =
      FirebaseFirestore.instance.collection('users');

  // * CREATE METHODE SET USER
  Future<void> setUser(UserModel user) async {
    try {
      _userReferences.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'hobby': user.hobby,
        'balance': user.balance,
      });
    } catch (e) {
      throw e;
    }
  }

  // * CREATE METHODE UNTUK MENGAMBIL USER PADA ID TERTENTU
  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReferences.doc(id).get();
      return UserModel(
        id: id,
        email: snapshot['email'],
        name: snapshot['name'],
        hobby: snapshot['hobby'],
        balance: snapshot['balance'],
      );
    } catch (e) {
      throw e;
    }
  }
}
