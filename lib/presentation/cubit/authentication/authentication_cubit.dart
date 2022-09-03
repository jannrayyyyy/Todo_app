import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/domain/entities/user_entity.dart';
import 'package:todo/domain/usecases/sign_in.dart';
import 'package:todo/domain/usecases/sign_out.dart';
import 'package:todo/domain/usecases/sign_up.dart';
import 'package:todo/domain/usecases/user_state.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final SignIn signIn;
  final SignUp signUp;
  final StreamUserState streamUserState;
  final SignOut signout;
  AuthenticationCubit(
    this.signIn,
    this.signUp,
    this.streamUserState,
    this.signout,
  ) : super(AuthenticationInitial());

  void userCheck() async {
    emit(Authenticating());
    final state = streamUserState();
    state.listen((user) {
      user != null
          ? emit(Authenticated(user: user))
          : emit(AuthenticationError());
    });
  }

  void signOut() async {
    await signout();
  }

  void signin(String email, String password) async {
    emit(Authenticating());
    await signIn(email, password);
  }

  void signup(UserEntity user) async {
    emit(Authenticating());
    await signUp(user);
  }
}
