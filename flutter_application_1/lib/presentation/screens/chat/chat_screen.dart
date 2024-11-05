import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/widgets/chat/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/736x/ba/5d/f7/ba5df704a239872432c72602d1e35fb9.jpg'),
          ),
        ),
        title: Text('Bicholover'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return MyMessageBubble();
              })),
              Text('Cristiano')
          ],
        ),
      ),
    );
  }
}
