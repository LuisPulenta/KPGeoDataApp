import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordError { empty, lengthmin, lengthmax }

// Extend FormzInput and provide the input type and error type.
class Password extends FormzInput<String, PasswordError> {
  // Call super.pure to represent an unmodified form input.
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Password.dirty(String value) : super.dirty(value);

  //Getter para el errormessage
  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == PasswordError.empty) return 'El campo es requerido';
    if (displayError == PasswordError.lengthmin) return 'Mínimo 6 caracteres';
    if (displayError == PasswordError.lengthmax) return 'Máximo 12 caracteres';
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PasswordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordError.empty;
    if (value.length < 6) return PasswordError.lengthmin;
    if (value.length > 12) return PasswordError.lengthmax;

    return null;
  }
}
