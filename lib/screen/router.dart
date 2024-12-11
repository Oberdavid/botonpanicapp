import 'package:boton_panic_app/screen/profile_screen.dart';
import 'package:go_router/go_router.dart';
import 'main_screen.dart';


final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MainScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => ProfileScreen(),
    ),
  ],
);
