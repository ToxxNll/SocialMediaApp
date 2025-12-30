import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/auth/domain/entities/app_user.dart';
import 'package:social_media_app/features/auth/domain/repos/auth_repo.dart';
import 'package:social_media_app/features/auth/presentation/cubits/auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AppUser? _currentUser;

  AuthCubit({required this.authRepo}) : super(AuthInitial());

  //check if user already exists
  void checkAuth() async{
    final AppUser? user = await authRepo.getCurrentUser();

    if (user != null){
      _currentUser = user;
      emit(Authenticated(user));
    }
    else{
      emit(Unauthenticated());
    }
  }

  //get current user

  //login w email+pw

  //register w email+pw

  //logout
}