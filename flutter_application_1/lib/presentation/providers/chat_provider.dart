import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/message.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/helpers/get_yes_no_answer.dart';
import 'package:flutter_application_1/domain/entities/message.dart';

// Proveedor que gestiona la lógica del chat y las interacciones de mensajes
// Esta clase utiliza un controlador de scroll para manejar el desplazamiento del chat y contiene métodos para enviar mensajes y manejar respuestas automáticas.
// Extiende [ChangeNotifier] para notificar cambios a los widgets que dependen de ella.

class ChatProvider extends ChangeNotifier {
  // Controlador de scroll que permite manejar el desplazamiento automático del chat.
  final chatScrollController = ScrollController();

  // Instancia de la clase GetYesNoAnswer para obtener respuestas automáticas.
  final getYesNoAnswer = GetYesNoAnswer();

  // Lista de mesajes predeterminados
  List<Message> messageList = [
    Message(text: 'Hola comandante', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del fut?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      otherReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  // Obtiene una respuesta automática llamando a [GetYesNoAnswer]
  // Agrega la respuesta obtenida a la lista de mensajes y notifica a los oyentes
  Future<void> otherReply() async {
    final otherMessage = await getYesNoAnswer.getAnswer();
    messageList.add(otherMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  // Desplaza el chat automáticamente al final de la lista de mensajes
  // Se realiza después de un pequeño retardo para asegurar que el contenido está disponible para desplazarse.
  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}