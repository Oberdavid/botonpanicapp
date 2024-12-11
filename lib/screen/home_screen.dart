import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          // Lógica para enviar la señal de alerta
          print('Imagen de pánico presionada');
          sendAlert();
        },
        child: Image.asset(
          'assets/panico2.png',
          width: 400, // Ajusta el tamaño según tus necesidades
          height: 400,
        ),
      ),
    );
  }

  void sendAlert() {
    // Lógica para enviar la señal de alerta
    print('Alerta enviada');
    // Aquí puedes agregar la lógica para enviar la alerta, por ejemplo, usando el paquete http
  }
}
