import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitial(true));

  final _firebase = FirebaseAuth.instance;

  void auth({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading(state.isLogin));
    try {
      if (state.isLogin) {
        //log in
        await _firebase.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        //sign up
        await _firebase.createUserWithEmailAndPassword(
            email: email, password: password);
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthError(state.isLogin, e.message));
    }
  }

  void changeMod() {
    emit(AuthModChanged(!state.isLogin));
  }
}
