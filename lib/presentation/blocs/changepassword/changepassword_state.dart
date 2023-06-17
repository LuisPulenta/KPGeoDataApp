part of 'changepassword_cubit.dart';

enum FormStatus { invalid, valid, validating }

class ChangePasswordFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Password oldPassword;
  final Password newPassword;
  final Password confirmPassword;
  final bool showPassword;

  const ChangePasswordFormState({
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
    this.oldPassword = const Password.pure(),
    this.newPassword = const Password.pure(),
    this.confirmPassword = const Password.pure(),
    this.showPassword = false,
  });

  ChangePasswordFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Password? oldPassword,
    Password? newPassword,
    Password? confirmPassword,
    bool? showPassword,
  }) =>
      ChangePasswordFormState(
        formStatus: formStatus ?? this.formStatus,
        isValid: isValid ?? this.isValid,
        oldPassword: oldPassword ?? this.oldPassword,
        newPassword: newPassword ?? this.newPassword,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        showPassword: showPassword ?? this.showPassword,
      );

  @override
  List<Object> get props => [
        formStatus,
        isValid,
        oldPassword,
        newPassword,
        confirmPassword,
        showPassword
      ];
}
