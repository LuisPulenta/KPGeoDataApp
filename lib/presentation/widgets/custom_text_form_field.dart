import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool? obscureText;
  final Function(String)? onChanged;
  final Function()? onChanged2;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  const CustomTextFormField(
      {super.key,
      this.label,
      this.hint,
      this.errorMessage,
      this.obscureText = false,
      this.onChanged,
      this.onChanged2,
      this.validator,
      this.prefixIcon,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    );
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText!,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: colors.primary),
        ),
        errorBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.red.shade800),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.red.shade800),
        ),
        isDense: true,
        fillColor: Colors.white,
        filled: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        focusColor: colors.primary,
        prefixIcon: Icon(
          prefixIcon,
          color: colors.primary,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            suffixIcon,
            color: colors.primary,
          ),
          onPressed: onChanged2,
        ),

        // icon: Icon(
        //   Icons.home,
        //   color: colors.primary,
        // ),
        errorText: errorMessage,
      ),
    );
  }
}
