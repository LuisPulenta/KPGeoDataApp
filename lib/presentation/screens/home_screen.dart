import 'package:flutter/material.dart';
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
        title: const Text('KPGeoData App'),
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
        children: const [],
      ),
    );
  }
}
