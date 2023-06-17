import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kpgeodataapp/presentation/blocs/changepassword/changepassword_cubit.dart';
import 'package:kpgeodataapp/presentation/widgets/widgets.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiar Contraseña'),
        centerTitle: true,
      ),
      body: BlocProvider(
          create: (context) => ChangePasswordCubit(),
          child: const _ChangePasswordView()),
    );
  }
}

//---------------------------------------------------------------
//------------------- _ChangePasswordView -----------------------
//---------------------------------------------------------------
class _ChangePasswordView extends StatelessWidget {
  const _ChangePasswordView();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0),
              child: Image(
                image: const AssetImage('assets/password.png'),
                width: size.width * 0.6,
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const _ChangePasswordForm(),
            SizedBox(
              height: size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}

//---------------------------------------------------------
//----------------- _ChangePasswordForm -------------------
//---------------------------------------------------------

class _ChangePasswordForm extends StatelessWidget {
  const _ChangePasswordForm();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    final changePasswordCubit = context.watch<ChangePasswordCubit>();
    final oldPassword = changePasswordCubit.state.oldPassword;
    final newPassword = changePasswordCubit.state.newPassword;
    final confirmPassword = changePasswordCubit.state.confirmPassword;
    final showPassword = changePasswordCubit.state.showPassword;

    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.01,
            ),
            CustomTextFormField(
              label: 'Contraseña actual',
              hint: 'Ingrese Contraseña actual...',
              errorMessage: oldPassword.errorMessage,
              prefixIcon: Icons.password,
              suffixIcon:
                  showPassword ? Icons.visibility : Icons.visibility_off,
              onChanged: (value) {
                changePasswordCubit.oldPasswordChanged(value);
              },
              obscureText: !showPassword,
              onChanged2: () {
                changePasswordCubit.toogleShowPassword();
              },
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            CustomTextFormField(
              label: 'Nueva Contraseña',
              hint: 'Ingrese nueva Contraseña...',
              errorMessage: newPassword.errorMessage,
              prefixIcon: Icons.password,
              suffixIcon:
                  showPassword ? Icons.visibility : Icons.visibility_off,
              onChanged: (value) {
                changePasswordCubit.newPasswordChanged(value);
              },
              obscureText: !showPassword,
              onChanged2: () {
                changePasswordCubit.toogleShowPassword();
              },
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            CustomTextFormField(
              label: 'Confirme Contraseña',
              hint: 'Confirme Contraseña...',
              errorMessage: confirmPassword.errorMessage,
              prefixIcon: Icons.password,
              suffixIcon:
                  showPassword ? Icons.visibility : Icons.visibility_off,
              onChanged: (value) {
                changePasswordCubit.confirmPasswordChanged(value);
              },
              obscureText: !showPassword,
              onChanged2: () {
                changePasswordCubit.toogleShowPassword();
              },
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            CustomButton(
              color: colors.inversePrimary,
              text: 'Cambiar contraseña',
              icon: Icons.save,
              width: double.infinity,
              height: 54,
              onPressed: () {
                changePasswordCubit.onSubmit();
              },
            ),
            SizedBox(
              height: size.height * 0.0125,
            ),
          ],
        ),
      ),
    );
  }
}
