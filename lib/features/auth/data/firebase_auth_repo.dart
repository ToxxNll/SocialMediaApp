import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media_app/features/auth/domain/entities/app_user.dart';
import 'package:social_media_app/features/auth/domain/repos/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<AppUser?> getCurrentUser() async {
    //get current loged in user
    final firebaseUser = firebaseAuth.currentUser;

    //user not logged in
    if (firebaseUser == null) {
      return null;
    }

    //user exists
    return AppUser(
      uid: firebaseUser.uid,
      email: firebaseUser.email!,
      name: '',
    );
  }

  @override
  Future<AppUser?> logOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<AppUser?> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    //attempt sign in
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          );

      //create user
      AppUser user = AppUser(
        uid: userCredential.user!.uid,
        email: email,
        name: 'name',
      );
      //return user
      return user;
    } catch (e) {
      throw Exception('Login failed $e');
    }
  }

  @override
  Future<AppUser?> registerWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    //attempt sign up
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          );

      //create user
      AppUser user = AppUser(
        uid: userCredential.user!.uid,
        email: email,
        name: name,
      );
      //return user
      return user;
    } catch (e) {
      throw Exception('Login failed $e');
    }
  }
}
