import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kpgeodataapp/config/routers/app_router_notifier.dart';
import 'package:kpgeodataapp/presentation/providers/providers.dart';
import 'package:kpgeodataapp/presentation/screens/screens.dart';

final goRouterProvider = Provider((ref) {
  final goRouterNotifier = ref.read(goRouterNotifierProvider);

// GoRouter configuration
  return GoRouter(
      initialLocation: '/checking',
      refreshListenable: goRouterNotifier,
      routes: [
        GoRoute(
          path: '/checking',
          builder: (context, state) => const CheckStatusScreen(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/theme',
          builder: (context, state) => const ThemeConfigScreen(),
        ),
        GoRoute(
          path: '/recoverpassword',
          builder: (context, state) => const RecoverPasswordScreen(),
        ),
        GoRoute(
          path: '/changepassword',
          builder: (context, state) => const ChangePasswordScreen(),
        ),
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/pantalla2',
          builder: (context, state) => const Pantalla2Screen(),
        ),
      ],
      redirect: (context, state) {
        final isGoingTo = state.subloc;
        final authStatus = goRouterNotifier.authStatus;

        if (isGoingTo == 'checking' && authStatus == AuthStatus.checking) {
          return null;
        }

        if (authStatus == AuthStatus.notAuthenticated) {
          if (isGoingTo == '/login') return null;
          return '/login';
        }

        if (authStatus == AuthStatus.authenticated) {
          if (isGoingTo == '/login' || isGoingTo == '/checking') return '/';
        }

        return null;
      });
});
