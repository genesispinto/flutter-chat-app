// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {

    final String text;
    void Function() onPressed;

  BotonAzul({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return MaterialButton(
            disabledColor: Colors.grey,
            elevation: 2,
            highlightElevation: 5,
            color: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),

            
            onPressed: onPressed,
            child:SizedBox(
              width: double.infinity,
              height: 55,
              child: Center(child: Text(text, 
              style: const TextStyle(color:Colors.white, fontSize: 17),)),
            )
             );
  }
}
