import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart' show UserModel;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<UserModel?> get user {
    return _auth.authStateChanges().map((user) {
      return user != null ? UserModel(user.uid, user.email!) : null;
    });
  }

  Future<UserModel?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return UserModel(result.user!.uid, result.user!.email!);
    } catch (e) {
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}