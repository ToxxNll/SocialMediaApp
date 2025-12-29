import 'package:social_media_app/features/auth/domain/entities/app_user.dart';

abstract class AuthRepo {
  Future<AppUser?> loginWithEmailAndPassword(
    String email,
    String password,
  );
  Future<AppUser?> registerWithEmailAndPassword(
    String email,
    String password,
    String name,
  );
  Future<AppUser?> logOut();
  Future<AppUser?> getCurrentUser();
}
