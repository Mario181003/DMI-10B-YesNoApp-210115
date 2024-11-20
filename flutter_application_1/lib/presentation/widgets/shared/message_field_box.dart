import 'package:flutter/material.dart';

// Widget que representa una caja de texto para ingresar y enviar mensajes
// Este widget es un campo de entrada de texto que permite al usuario escribir y enviar mensajes. Incluye un botón de envío y admite la finalización de mensajes presionando "Enter" o tocando el ícono de envío
class MessageFieldBox extends StatelessWidget {

  // Función que se ejecuta cuando se envía el valor ingresado
  // [onValue] es una función de tipo [ValueChanged<String>] que recibe el texto ingresado por el usuario cuando se envía
  final ValueChanged<String> onValue;

  // Constructor de [MessageFieldBox]
  // [onValue] es requerido y define la acción que ocurre cuando se envía un mensaje.
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    // Controlador para manejar el texto del campo de entrada.
    final textController = TextEditingController();

    // Nodo de enfoque para controlar el enfoque del campo de texto
    final focusNode = FocusNode();

    // Borde personalizado para el campo de texto
    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    // Decoración personalizada para el campo de entrada de texto
    final inputDecoration = InputDecoration(
        hintText: 'Termine su mensaje con un "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text;
            textController.clear();
            onValue(textValue);
          },
        )
      );

    return TextFormField(
      onTapOutside: (event) {
        // Desenfoca el campo al tocar fuera del área.
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        // Acciones al presionar "Enter" en el teclado.
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}