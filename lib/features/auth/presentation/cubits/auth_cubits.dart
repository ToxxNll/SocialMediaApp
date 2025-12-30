import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/auth/domain/entities/app_user.dart';
import 'package:social_media_app/features/auth/domain/repos/auth_repo.dart';
import 'package:social_media_app/features/auth/presentation/cubits/auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  //при вызыве кубита можно указать любой репо который наследует AuthRepo - FireBaseAuthRepo
  final AuthRepo authRepo;
  AppUser? _currentUser;

  AuthCubit({required this.authRepo}) : super(AuthInitial());

  //check if user already exists
  void checkAuth() async {
    final AppUser? user = await authRepo.getCurrentUser();

    if (user != null) {
      _currentUser = user;
      emit(Authenticated(user));
    } else {
      emit(Unauthenticated());
    }
  }

  //get current user
  AppUser? get currentUser => _currentUser;

  //login w email+pw
  Future<void> login(String email, String pw) async {
    try {
      emit(AuthLoading());
      //код понимает что user будет класса AppUser из entities, потому что метод логина возвращает класс AppUser
      final user = await authRepo.loginWithEmailAndPassword(
        email,
        pw,
      );
      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthErrors(e.toString()));
      emit(Unauthenticated());
    }
  }

  //register w email+pw
  Future<void> register(
    String name,
    String email,
    String pw,
  ) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.registerWithEmailAndPassword(
        name,
        email,
        pw,
      );
      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      }
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthErrors(e.toString()));
      emit(Unauthenticated());
    }
  }

  //logout
  Future<void> logOut() async {
    authRepo.logOut();
    emit(Unauthenticated());
  }
}
