import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:kpgeodataapp/infrastructure/inputs/inputs.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginFormState> {
  LoginCubit() : super(const LoginFormState());

  void onSubmit() {
    emit(state.copyWith(
      formStatus: FormStatus.validating,
      password: Password.dirty(state.password.value),
      email: Email.dirty(state.email.value),
      showPassword: state.showPassword,
      isValid: Formz.validate([state.email, state.password]),
    ));

    //print('Cubit Submit2: ${state.email} ${state.password}');
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.email, password]),
      ),
    );
  }

  void toogleShowPassword() {
    emit(
      state.copyWith(
        showPassword: !state.showPassword,
        isValid: Formz.validate([state.email, state.password]),
      ),
    );
  }
}
