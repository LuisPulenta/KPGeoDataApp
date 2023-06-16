import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kpgeodataapp/config/constants/constants.dart';
import 'package:kpgeodataapp/presentation/blocs/login/login_cubit.dart';
import 'package:kpgeodataapp/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login'),
      //   centerTitle: true,
      // ),
      body: BlocProvider(
          create: (context) => LoginCubit(), child: const _LoginView()),
    );
  }
}

//---------------------------------------------------------------
//------------------------ _LoginView ---------------------------
//---------------------------------------------------------------
class _LoginView extends StatelessWidget {
  const _LoginView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.1),
              child: Image(
                image: const AssetImage('assets/kplogo.png'),
                width: size.width * 0.8,
              ),
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            Text(
              'KPGeoData App V.${Constants.version}',
              style: textStyles.headlineLarge!.copyWith(color: colors.primary),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            _LoginForm(),
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
//----------------------- _LoginForm ----------------------
//---------------------------------------------------------

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    final loginCubit = context.watch<LoginCubit>();
    final email = loginCubit.state.email;
    final password = loginCubit.state.password;
    final showPassword = loginCubit.state.showPassword;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: colors.primary.withOpacity(.5),
            blurRadius: 20.0,
            spreadRadius: 0.0,
            offset: const Offset(
              10.0,
              10.0,
            ),
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: colors.primary,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 30,
        color: colors.secondaryContainer,
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                CustomTextFormField(
                  label: 'Correo electrónico',
                  hint: 'Ingrese Correo electrónico...',
                  errorMessage: email.errorMessage,
                  prefixIcon: Icons.email,
                  onChanged: (value) {
                    loginCubit.emailChanged(value);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  label: 'Contraseña',
                  hint: 'Ingrese Contraseña...',
                  errorMessage: password.errorMessage,
                  prefixIcon: Icons.password,
                  suffixIcon:
                      showPassword ? Icons.visibility : Icons.visibility_off,
                  onChanged: (value) {
                    loginCubit.passwordChanged(value);
                  },
                  obscureText: !showPassword,
                  onChanged2: () {
                    loginCubit.toogleShowPassword();
                  },
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                CustomButton(
                  color: colors.inversePrimary,
                  text: 'Ingresar',
                  icon: Icons.login,
                  width: double.infinity,
                  height: 54,
                  onPressed: () {
                    loginCubit.onSubmit();
                  },
                ),
                SizedBox(
                  height: size.height * 0.0125,
                ),
                TextButton(
                    onPressed: () {
                      context.push('/recoverpasswordscreen');
                    },
                    child: Text(
                      'Olvidé mi contraseña',
                      style: textStyles.titleMedium!.copyWith(
                          color: colors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: colors.primary),
                    )),
                SizedBox(
                  height: size.height * 0.0125,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
