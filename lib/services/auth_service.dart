import 'package:airplane_apps/models/user_model.dart';
import 'package:airplane_apps/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // * CREATE OBJECT
  FirebaseAuth _auth = FirebaseAuth.instance;

  // * CRAETE METHODE SIGN IN
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // * SIGN DENGAN USER YANG SUDAH ADA
      UserModel user =
          await UserService().getUserById(userCredential.user!.uid);
      return user;
    } catch (e) {
      throw e;
    }
  }

  // * CREATE METHODE SIGN UP
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
    String hobby = '',
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // * ISIKAN USER MODEL
      UserModel user = UserModel(
        id: userCredential.user!.uid,
        email: email,
        name: name,
        hobby: hobby,
        balance: 280000000,
      );

      // * MENUNGGU USER SERVICE UNTUK MEMBUAT USER
      await UserService().setUser(user);
      return user;
    } catch (e) {
      throw e;
    }
  }

  // * CREATE METHODE SIGN OUT
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw e;
    }
  }
}
