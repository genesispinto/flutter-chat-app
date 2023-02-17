import 'package:flutter/material.dart';

class Logo extends StatelessWidget {

  final String titulo;
  const Logo({
    Key? key, required this.titulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
             const  Center(
              child: Image(
                image: AssetImage('assets/tag-logo.png'), 
                width: 160,),
            ),
            const SizedBox(height: 20,),
            Center(child: Text( titulo, style: TextStyle(fontSize: 30),)),
        ],
      ),
    );
  }
}