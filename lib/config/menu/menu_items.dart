import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subtitle,
      required this.link,
      required this.icon});
}

const List<MenuItem> appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Pantalla 2',
      subtitle: 'Subtìtulo de la Pantalla 2',
      link: '/pantalla2',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Pantalla 3',
      subtitle: 'Subtìtulo de la Pantalla 3',
      link: '/pantalla3',
      icon: Icons.credit_card),
  MenuItem(
      title: 'Pantalla 4',
      subtitle: 'Subtìtulo de la Pantalla 4',
      link: '/pantalla4',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'Cambiar tema',
      subtitle: 'Cambiar tema de la Aplicación',
      link: '/theme',
      icon: Icons.color_lens_outlined),
  MenuItem(
      title: 'Cambiar Contraseña',
      subtitle: 'Cambiar Contraseña',
      link: '/changepassword',
      icon: Icons.password),
  MenuItem(
      title: 'Cerrar Sesión',
      subtitle: 'Cerrar Sesión',
      link: '/',
      icon: Icons.exit_to_app),
];
