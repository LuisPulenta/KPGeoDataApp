part of 'login_cubit.dart';

enum FormStatus { invalid, valid, validating }

class LoginFormState {
  final FormStatus formStatus;
  final bool isValid;
  final Email email;
  final Password password;
  final bool showPassword;

  const LoginFormState({
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.showPassword = false,
  });

  LoginFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Email? email,
    Password? password,
    bool? showPassword,
  }) =>
      LoginFormState(
        formStatus: formStatus ?? this.formStatus,
        isValid: isValid ?? this.isValid,
        email: email ?? this.email,
        password: password ?? this.password,
        showPassword: showPassword ?? this.showPassword,
      );

  @override
  List<Object> get props =>
      [formStatus, isValid, email, password, showPassword];
}
