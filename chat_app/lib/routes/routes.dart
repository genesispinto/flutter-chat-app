import 'package:chat_app/pages/page.dart';
import 'package:flutter/cupertino.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {

  ('usuarios'): (context)=> const UsuariosPage(),
  ('chat'): (context)=> const ChatPage(),
  ('loading'): (context)=> const LoadingPage(),
  ('login'): (context)=> const LoginPage(),
  ('register'): (context)=> const RegisterPage(),
};