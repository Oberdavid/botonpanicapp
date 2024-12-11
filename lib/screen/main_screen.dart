import 'package:boton_panic_app/screen/coments_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'home_screen.dart';
import 'location_screen.dart';
import 'notifications_screen.dart';
import 'agregar_contactos.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    LocationScreen(),
    CommentsScreen(),
    NotificationsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 0
            ? 'App de ayuda'
            : _selectedIndex == 1
                ? 'Ubicación'
                : _selectedIndex == 2
                    ? 'Comentarios'
                    : 'Notificaciones'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Editar Perfil'),
              onTap: () {
                context.go('/profile');
              },
            ),
            ListTile(
              title: Text('Agregar Contactos'),
              onTap: () {
                context.go('/agregar');
              },
            ),
            ListTile(
              title: Text('Cerrar Sesion'),
              onTap: () {
                context.go('/profile');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Ubicación',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment),
            label: 'Comentarios',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificaciones',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
