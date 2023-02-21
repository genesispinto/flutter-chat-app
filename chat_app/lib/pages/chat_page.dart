import 'dart:io';

import 'package:chat_app/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
   
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  final List<ChatMessage> _message = [];

  bool _writting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Column(
          children: const [
            CircleAvatar(
              maxRadius: 13,
              child: Text('Ge', style: TextStyle(fontSize: 12),),
            ),
            SizedBox(height: 3,),
            Text('Genesis Pinto', style: TextStyle(color: Colors.black87, fontSize: 12))
          ],
        ) ),
      body: Column(
        children: [
          Flexible(child: ListView.builder(
            //reverse: true,
            itemCount: _message.length,
            itemBuilder: ((context, index) => _message[index])
            )
            ),
          const Divider(height: 1,),
          Container(
           color: Colors.white,
           height: 50,
           child: _inputChat(),
          )
        ],
      )
    );


  }

      Widget _inputChat(){
      return SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8) ,
          child: Row(
            children: [
              Flexible(child: TextField(
                controller: _textController,
                onSubmitted: ((value) {}),
                onChanged: ((String text) {
                  setState(() {
                    if(text.trim().isNotEmpty){
                      _writting = true;
                    }
                  });
                }),
                focusNode: _focusNode,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Enviar mensaje'),
                )
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: Platform.isIOS 
                  ? CupertinoButton(
                    onPressed: _writting 
                      ? () => _handleSubmit(_textController.text)
                      : null,
                    child: const Text('Enviar')) 
                  : IconTheme(
                    data: IconThemeData(color: Colors.blue[400]),
                    child: IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: const Icon(Icons.send), 
                      onPressed: _writting 
                      ? () => _handleSubmit(_textController.text)
                      : null
                        ),
                  )
                )
            ],
          ),
          )
          );
    }

    _handleSubmit(String text){
      final newMessage = ChatMessage(
        texto: text, 
        uid: '1', );
       
      _message.add(newMessage);
      setState(() {
        _writting = false;
      });
      
      _textController.clear();
      _focusNode.requestFocus();
    }
}