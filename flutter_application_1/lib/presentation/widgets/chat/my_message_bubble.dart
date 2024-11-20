import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/message.dart';

// Widget que representa una burbuja de mensaje enviada por el usuario
// Este widget muestra el mensaje del usuario dentro de una burbuja de estilo personalizado. La burbuja tiene un fondo con el color primario del tema y bordes redondeados.
class MyMessageBubble extends StatelessWidget {
  final Message message;

  const MyMessageBubble({
    super.key, 
    required this.message
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          // Define la decoración de la burbuja (color y bordes).
          decoration: BoxDecoration(
            // Fondo de la burbuja usando el color primario.
              color: colors.primary, borderRadius: BorderRadius.circular(20)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10) // Espacio entre las burbujas.
      ],
    );
  }
}