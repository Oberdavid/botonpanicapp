import 'package:http/http.dart' as http;

Future<void> sendAlert() async {
  final response = await http.post(
    Uri.parse('https://tu-servidor.com/alerta'),
    body: {'mensaje': '¡Necesito ayuda!'},
  );

  if (response.statusCode == 200) {
    print('Alerta enviada con éxito');
  } else {
    print('Error al enviar la alerta');
  }
}
