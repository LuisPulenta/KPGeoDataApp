import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kpgeodataapp/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('HomeScreen'),
        centerTitle: true,
      ),
      body: _HomeView(colors: colors),
      drawer: SideMenu(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}

//---------------------------------------------------------------
//-------------------------- _HomeView --------------------------
//---------------------------------------------------------------
class _HomeView extends StatelessWidget {
  const _HomeView({
    required this.colors,
  });

  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            color: colors.inversePrimary,
            text: 'Configuración',
            icon: Icons.settings,
            onPressed: () {
              context.push('/theme');
            },
          ),
          CustomButton(
            color: colors.inversePrimary,
            text: 'SnackBar',
            icon: Icons.messenger_outline_outlined,
            onPressed: () {
              final snack = CustomSnackbar(
                message: 'Esto es un mensaje!!',
                color: colors.primary,
              );
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(snack);
              return;
            },
          ),
          CustomButton(
            color: colors.inversePrimary,
            text: 'Cuadro de diálogo',
            icon: Icons.question_mark,
            onPressed: () {
              openDialog(
                context: context,
                title: 'Está seguro???',
                message: 'Lorem Ipsum es simplemente el texto de relleno.',
                onPressed: () {
                  Navigator.pop(context);
                  context.push('/theme');
                },
              );
            },
          ),
          CustomButton(
            color: colors.inversePrimary,
            text: 'Login',
            icon: Icons.login,
            onPressed: () {
              context.push('/login');
            },
          ),
        ],
      ),
    );
  }
}
