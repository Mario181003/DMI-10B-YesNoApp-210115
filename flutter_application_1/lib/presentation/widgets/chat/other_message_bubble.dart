import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/message.dart';

// Widget que representa una burbuja de mensaje recibida de otro usuario
// Muestra el mensaje en una burbuja con estilo personalizado y, si aplica, muestra una imagen asociada al mensaje. El diseño de la burbuja se ajusta al color secundario del tema.
class OtherMessageBubble extends StatelessWidget {
  final Message message;
  
  // Constructor de [OtherMessageBubble].
  // [message] es un objeto de tipo [Message] que contiene el texto a mostrar.
  const OtherMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      // Alinea la burbuja a la izquierda.
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),
        _ImageBubble( message.imageUrl! ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble( this.imageUrl );

  @override
  Widget build(BuildContext context) {
    // Obtiene el tamaño de la pantalla para ajustar el ancho de la imagen.
    final size = MediaQuery.of(context).size;

    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          imageUrl,
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
          // Muestra un mensaje de carga mientras la imagen está descargando.
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

          // Muestra un texto informando que la imagen se está cargando.
            return Container(
              width: size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text('Cristiano esta enviando una imagen'),
            );
          },
        ));
  }
}