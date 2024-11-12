import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> message = [
    Message(text: 'Hola GOAT!', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del Fut?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    // TODO: im´plementar método
    
  }
}
