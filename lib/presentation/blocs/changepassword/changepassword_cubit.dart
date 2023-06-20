import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:kpgeodataapp/infrastructure/infrastructure.dart';

part 'changepassword_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordFormState> {
  ChangePasswordCubit() : super(const ChangePasswordFormState());

  void onSubmit() {
    emit(state.copyWith(
      formStatus: FormStatus.validating,
      oldPassword: Password.dirty(state.oldPassword.value),
      newPassword: Password.dirty(state.newPassword.value),
      confirmPassword: Password.dirty(state.confirmPassword.value),
      isValid: Formz.validate(
          [state.oldPassword, state.newPassword, state.confirmPassword]),
    ));
  }

  void oldPasswordChanged(String value) {
    final oldPassword = Password.dirty(value);
    emit(
      state.copyWith(
        oldPassword: oldPassword,
        isValid: Formz.validate(
            [oldPassword, state.newPassword, state.confirmPassword]),
      ),
    );
  }

  void newPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    emit(
      state.copyWith(
        newPassword: newPassword,
        isValid: Formz.validate(
            [state.oldPassword, newPassword, state.confirmPassword]),
      ),
    );
  }

  void confirmPasswordChanged(String value) {
    final confirmPassword = Password.dirty(value);
    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
        isValid: Formz.validate(
            [state.oldPassword, state.newPassword, confirmPassword]),
      ),
    );
  }

  void toogleShowPassword() {
    emit(
      state.copyWith(
        showPassword: !state.showPassword,
        isValid: Formz.validate(
            [state.oldPassword, state.newPassword, state.confirmPassword]),
      ),
    );
  }
}
