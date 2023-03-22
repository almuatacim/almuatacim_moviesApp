part of 'login_cubit.dart';

enum Status { init, loading, success, error }

class LoginState extends Equatable {
  final String? userName;
  final String? password;
  final Status? status;
  final Resource? resource;

  LoginState(
      {this.userName, this.password, this.status = Status.init, this.resource});

  LoginState copywith(
      {String? userName,
      String? password,
      Status? status,
      Resource? resource}) {
    return LoginState(
        userName: userName ?? this.userName,
        password: password ?? this.password,
        status: status ?? this.status,
        resource: resource ?? this.resource);
  }

  @override
  List<Object?> get props => [userName, password, status, resource];
}
