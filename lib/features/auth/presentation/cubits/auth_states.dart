import 'package:social_media_app/features/auth/domain/entities/app_user.dart';

abstract class AuthState {}

//initial
class AuthInitial extends AuthState{}

//loading..
class AuthLoading extends AuthState{}

//authenticated
class Authenticated extends AuthState{
  final AppUser user;
  Authenticated(this.user);
}

//unauthenticated
class Unauthenticated extends AuthState{}

//errors
class AuthErrors extends AuthState{
  final String massage;
  AuthErrors(this.massage);
}