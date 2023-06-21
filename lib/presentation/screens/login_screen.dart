import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kpgeodataapp/config/constants/environment.dart';
import 'package:kpgeodataapp/presentation/providers/providers.dart';
import 'package:kpgeodataapp/presentation/widgets/widgets.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginForm = ref.watch(loginFormProvider);
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login'),
      //   centerTitle: true,
      // ),
      body: Stack(
        children: [
          const GeometricalBackground(child: _LoginView()),
          loginForm.isPosting
              ? const LoaderComponent(
                  text: 'Por favor espere...',
                )
              : Container()
        ],
      ),
    );
  }
}

//---------------------------------------------------------------
//------------------------ _LoginView ---------------------------
//---------------------------------------------------------------
class _LoginView extends StatelessWidget {
  const _LoginView();

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
              'KPGeoData App V.${Environment.version}',
              style: textStyles.headlineLarge!.copyWith(color: colors.primary),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            const _LoginForm(),
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

class _LoginForm extends ConsumerWidget {
  const _LoginForm();

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginForm = ref.watch(loginFormProvider);

    ref.listen(authProvider, (previous, next) {
      if (next.errorMessage.isEmpty) return;
      showSnackbar(context, next.errorMessage);
    });

    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    //final loginCubit = context.watch<LoginCubit>();
    // final email = loginCubit.state.email;
    // final password = loginCubit.state.password;

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
                  keyboardType: TextInputType.emailAddress,
                  onChanged: ref.read(loginFormProvider.notifier).onEmailChange,
                  errorMessage: loginForm.isFormPosted
                      ? loginForm.email.errorMessage
                      : null,
                  prefixIcon: Icons.email,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  label: 'Contraseña',
                  hint: 'Ingrese Contraseña...',
                  errorMessage: loginForm.isFormPosted
                      ? loginForm.password.errorMessage
                      : null,
                  prefixIcon: Icons.password,
                  suffixIcon: loginForm.showPassword
                      ? Icons.visibility
                      : Icons.visibility_off,
                  onChanged:
                      ref.read(loginFormProvider.notifier).onPasswordChange,
                  onFieldSubmitted: (_) =>
                      ref.read(loginFormProvider.notifier).onFormSubmit(),
                  obscureText: !loginForm.showPassword,
                  onChanged2: () {
                    ref.read(loginFormProvider.notifier).toogleShowPassword();
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
                    onPressed: loginForm.isPosting
                        ? null
                        : () {
                            FocusScope.of(context)
                                .unfocus(); //Oculta el teclado
                            ref.read(loginFormProvider.notifier).onFormSubmit();
                          }),
                SizedBox(
                  height: size.height * 0.0125,
                ),
                TextButton(
                    onPressed: () {
                      context.push('/recoverpassword');
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
