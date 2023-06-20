import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:kpgeodataapp/infrastructure/infrastructure.dart';

part 'recoverpassword_state.dart';

class RecoverPasswordCubit extends Cubit<RecoverPasswordFormState> {
  RecoverPasswordCubit() : super(const RecoverPasswordFormState());

  void onSubmit() {
    emit(state.copyWith(
      formStatus: FormStatus.validating,
      email: Email.dirty(state.email.value),
      isValid: Formz.validate([state.email]),
    ));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email]),
      ),
    );
  }
}
