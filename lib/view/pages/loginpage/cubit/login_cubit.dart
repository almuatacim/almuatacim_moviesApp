import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/core/Resource.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());
  void login() async {
    emit(state.copywith(status: Status.loading));
    await Future.delayed(Duration(seconds: 2));
    emit(state.copywith(status: Status.success));
  }

  void loginWithFireBase(
      {required String email, required String password}) async {
    emit(state.copywith(status: Status.loading));
    try {
      var data = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(data.toString());
      emit(state.copywith(
          status: Status.success, resource: Success(data: data)));
    } catch (e) {
      emit(state.copywith(status: Status.error, resource: Error(message: e)));
    }
    emit(state.copywith(status: Status.init));
  }

  void onUserNameChange(String value) {
    emit(state.copywith(userName: value));
  }

  void onPasswordChange(String value) {
    emit(state.copywith(password: value));
  }
}
