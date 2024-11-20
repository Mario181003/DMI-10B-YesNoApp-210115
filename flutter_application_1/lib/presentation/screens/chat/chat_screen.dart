import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/domain/entities/message.dart';

import 'package:flutter_application_1/presentation/providers/chat_provider.dart';
import 'package:flutter_application_1/presentation/widgets/chat/other_message_bubble.dart';
import 'package:flutter_application_1/presentation/widgets/chat/my_message_bubble.dart';
import 'package:flutter_application_1/presentation/widgets/shared/message_field_box.dart';


// Pantalla principal que muestra el chat y permite la interacción con mensajes
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

// Esta pantalla contiene una barra de título personalizada y un cuerpo donde se muestra una lista de mensajes. El usuario puede ver y enviar mensajes.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/736x/ba/5d/f7/ba5df704a239872432c72602d1e35fb9.jpg'),
          ),
        ),
        title: const Text('CR7'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

// Widget que muestra la vista de mensajes del chat y un campo para escribir mensajes
// Este widget consume [ChatProvider] para obtener y mostrar los mensajes del chat
// Utiliza un [ListView] para mostrar los mensajes y un widget de entrada para enviar nuevos mensajes.
class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];
                       
                      return (message.fromWho == FromWho.other)
                          ? OtherMessageBubble( message: message )
                          : MyMessageBubble( message: message );
                    })),

            /// Caja de texto de mensajes
            MessageFieldBox(
              // onValue: (value) => chatProvider.sendMessage(value),
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}