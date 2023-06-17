part of 'recoverpassword_cubit.dart';

enum FormStatus { invalid, valid, validating }

class RecoverPasswordFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Email email;

  const RecoverPasswordFormState({
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
    this.email = const Email.pure(),
  });

  RecoverPasswordFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Email? email,
    Password? password,
    bool? showPassword,
  }) =>
      RecoverPasswordFormState(
        formStatus: formStatus ?? this.formStatus,
        isValid: isValid ?? this.isValid,
        email: email ?? this.email,
      );

  @override
  List<Object> get props => [formStatus, isValid, email];
}
