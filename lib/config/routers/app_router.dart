import 'package:go_router/go_router.dart';
import 'package:kpgeodataapp/presentation/screens/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/theme',
      builder: (context, state) => const ThemeConfigScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/pantalla2',
      builder: (context, state) => const Pantalla2Screen(),
    ),
  ],
);
