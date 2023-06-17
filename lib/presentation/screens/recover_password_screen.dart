import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kpgeodataapp/presentation/blocs/recoverpassword/recoverpassword_cubit.dart';
import 'package:kpgeodataapp/presentation/widgets/widgets.dart';

class RecoverPasswordScreen extends StatelessWidget {
  const RecoverPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar Contraseña'),
        centerTitle: true,
      ),
      body: BlocProvider(
          create: (context) => RecoverPasswordCubit(),
          child: const _RecoverPasswordView()),
    );
  }
}

//---------------------------------------------------------------
//------------------- _RecoverPasswordView ----------------------
//---------------------------------------------------------------
class _RecoverPasswordView extends StatelessWidget {
  const _RecoverPasswordView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0),
              child: Image(
                image: const AssetImage('assets/recoverpassword.png'),
                width: size.width * 0.6,
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            _RecoverPassword(),
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
//-------------------- _RecoverPassword -------------------
//---------------------------------------------------------

class _RecoverPassword extends StatelessWidget {
  const _RecoverPassword();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    final recoverPasswordCubit = context.watch<RecoverPasswordCubit>();
    final email = recoverPasswordCubit.state.email;

    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.01,
            ),
            CustomTextFormField(
              label: 'Correo electrónico',
              hint: 'Ingrese Correo electrónico...',
              errorMessage: email.errorMessage,
              prefixIcon: Icons.email,
              onChanged: (value) {
                recoverPasswordCubit.emailChanged(value);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              color: colors.inversePrimary,
              text: 'Recuperar contraseña',
              icon: Icons.login,
              width: double.infinity,
              height: 54,
              onPressed: () {
                recoverPasswordCubit.onSubmit();
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
