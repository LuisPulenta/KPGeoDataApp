import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kpgeodataapp/config/menu/menu_items.dart';
import 'package:kpgeodataapp/presentation/providers/providers.dart';
import 'package:kpgeodataapp/presentation/widgets/widgets.dart';

class SideMenu extends ConsumerStatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  SideMenuState createState() => SideMenuState();
}

class SideMenuState extends ConsumerState<SideMenu> {
  //---------------------------------------------------------
  //------------------- Variables ---------------------------
  //---------------------------------------------------------

  int navDraweIndex = 0;

  //---------------------------------------------------------
  //------------------- iniState ----------------------------
  //---------------------------------------------------------

  //---------------------------------------------------------
  //------------------- Pantalla ----------------------------
  //---------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return NavigationDrawer(
        selectedIndex: navDraweIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDraweIndex = value;
          });

          final menuItem = appMenuItems[value];
          context.push(menuItem.link);
          widget.scaffoldKey.currentState?.closeDrawer();
        },
        children: [
          _CustomDrawerHeader(colors: colors),
          // const NavigationDrawerDestination(
          //   icon: Icon(Icons.home),
          //   label: Text('Home Screen'),
          // ),
          // const NavigationDrawerDestination(
          //   icon: Icon(Icons.person),
          //   label: Text('Usuarios'),
          // ),
          // const NavigationDrawerDestination(
          //   icon: Icon(Icons.settings),
          //   label: Text('Configuración'),
          // ),

          ...appMenuItems.sublist(0, 3).map(
                (e) => NavigationDrawerDestination(
                  icon: Icon(e.icon),
                  label: Text(e.title),
                ),
              ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 0, 28, 0),
            child: Divider(
              color: Colors.black,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 0, 28, 0),
            child: Text('Más opciones'),
          ),
          ...appMenuItems.sublist(3, 5).map(
                (e) => NavigationDrawerDestination(
                  icon: Icon(e.icon),
                  label: Text(e.title),
                ),
              ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 0, 28, 0),
            child: Divider(
              color: Colors.black,
            ),
          ),
          ...appMenuItems.sublist(5).map(
                (e) => NavigationDrawerDestination(
                  icon: Icon(e.icon),
                  label: Text(e.title),
                ),
              ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomButton(
                icon: Icons.exit_to_app,
                color: colors.inversePrimary,
                onPressed: () {
                  ref.read(authProvider.notifier).logout();
                },
                text: 'Cerrar sesión'),
          ),
        ]);
  }
}

//------------------------------------------------------------
//--------------------- _CustomDrawerHeader ------------------
//------------------------------------------------------------

class _CustomDrawerHeader extends StatelessWidget {
  const _CustomDrawerHeader({
    required this.colors,
  });

  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        //color: colors.primary,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colors.primary,
            colors.secondary,
          ],
        ),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Image(
              image: AssetImage('assets/logo.png'),
              width: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Text(
                  "Usuario: ",
                  style: (TextStyle(
                      color: colors.inversePrimary,
                      fontWeight: FontWeight.bold)),
                ),
                Text(
                  'Nombre del Usuario',
                  style: (TextStyle(color: colors.inversePrimary)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
