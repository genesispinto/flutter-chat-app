import 'package:chat_app/widgets/boton_azul.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/widgets/widgets.dart';


class RegisterPage extends StatelessWidget {
   
  const RegisterPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 15, color: Colors.grey[400]);
    return  Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: ListView(
          children:  [
            const Logo(titulo: 'Registro',),
            const _Form(),
            Label(textStyle: textStyle, ruta: 'login', text: 'Ingresa con tu cuenta', subtitulo: '¿Ya tienes una cuenta?', )
            
          ],),
      )
    );
  }
}


class _Form extends StatefulWidget {
  const _Form({
    Key? key,
  }) : super(key: key);

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.perm_identity, 
            placeholder: 'Nombre', 
            textController: nameCtrl,
            ),
          CustomInput(
            icon: Icons.mail_outline, 
            placeholder: 'Correo', 
            textController: emailCtrl,
            keyboardType: TextInputType.emailAddress,
            ),
          CustomInput(
            icon: Icons.lock_outline, 
            placeholder: 'Contraseña', 
            textController: passCtrl,
            isPassword: true,
            ),
          

          BotonAzul(
          text:'Ingrese', 
          onPressed:  ()=> Navigator.pushNamed(context,'chat'))

        ],
      ),
    );
  }
}

