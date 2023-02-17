import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String text;
  final String subtitulo;
  final String ruta;
  const Label({
    Key? key,
    required this.textStyle, required this.ruta, required this.text, required this.subtitulo,
  }) : super(key: key);

  final TextStyle textStyle
  ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
        onPressed: (() {}), 
        child:  Text(subtitulo,style: textStyle)),
      
        TextButton(
        onPressed: (() => Navigator.pushReplacementNamed(context, ruta)), 
        child: Text(text,style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue) )),
      
        TextButton(
        onPressed: (() {}), 
        child:  Text('Terminos y condiciones de uso',style: textStyle)),
      ],
    );
  }
}
