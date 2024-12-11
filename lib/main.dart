import 'package:boton_panic_app/screen/agregar_contactos.dart';
import 'package:boton_panic_app/screen/home_screen.dart';
import 'package:boton_panic_app/screen/main_screen.dart';
import 'package:boton_panic_app/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

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
    GoRoute(
      path: '/agregar',
      builder: (context, state) => const AgregarContactos(),
    ),
    GoRoute(
      path: '/Home',
      builder: (context, state) => HomeScreen(),
    ),
  ],
);
