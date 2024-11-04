import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://i.pinimg.com/736x/ba/5d/f7/ba5df704a239872432c72602d1e35fb9.jpg'),
          ),
        ),
        title: Text('Bicholover'),
        centerTitle: false,
      ),
    );
  }
}