import 'package:social_media_app/features/auth/domain/entities/app_user.dart';
import 'package:social_media_app/features/auth/domain/repos/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo {
  @override
  Future<AppUser?> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<AppUser?> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<AppUser?> loginWithEmailAndPassword(
    String email,
    String password,
  ) {
    // TODO: implement loginWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<AppUser?> registerWithEmailAndPassword(
    String email,
    String Password,
  ) {
    // TODO: implement registerWithEmailAndPassword
    throw UnimplementedError();
  }
}
