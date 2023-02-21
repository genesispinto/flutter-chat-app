

import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  final String texto;
  final String uid;

   const ChatMessage({
    super.key, 
    required this.texto, 
    required this.uid, 
    });

  @override
  Widget build(BuildContext context) {
    return 
        Container(
          child: uid == '1'
          ? _myMessage()
          : _notMyMessage(),
    );
  }
  
  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(8),
        
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Text(texto),
        
        ),
    );
  }
  
  Widget _notMyMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(8),
        
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Text(texto),
        
        ),
    );
  }
}