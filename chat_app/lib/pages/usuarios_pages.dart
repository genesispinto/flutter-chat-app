
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:chat_app/models/usuario.dart';
class UsuariosPage extends StatefulWidget {
   
  const UsuariosPage({Key? key}) : super(key: key);

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {

  final usuarios = [
    Usuario(email:'genesisgps@gmail.com' , nombre: 'Genesis', omline: false, uid: '1'),
    Usuario(email:'josuegarcia@gmail.com' , nombre: 'Josue', omline: true, uid: '2'),
    Usuario(email:'rodolfo@gmail.com' , nombre: 'Rodolfo', omline: false, uid: '3'),
    Usuario(email:'irene@gmail.com' , nombre: 'Irene', omline: false, uid: '4'),
    Usuario(email:'Mary@gmail.com' , nombre: 'Marianny', omline: true, uid: '5'),
  ];

 final RefreshController _refreshController = RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Mi nombre', style: TextStyle(color: Colors.black54),),
        
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app_outlined, color: Colors.black54,), 
          onPressed: () {  }, ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle, color: Colors.blue[400],),
            //: Icon(Icons.check_circle, color: Colors.red,),
          )
        ],

      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: true,
        header: const WaterDropHeader(),
        onRefresh: _cargarUsuarios,
        child: _UsuarioListTile(usuarios: usuarios),)
      
      
      
    );
  }
  void _cargarUsuarios() async{
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}

class _UsuarioListTile extends StatelessWidget {
  const _UsuarioListTile({
    Key? key,
    required this.usuarios,
  }) : super(key: key);

  final List<Usuario> usuarios;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: ((context, index) => ListTile(
        title: Text(usuarios[index].nombre),
        subtitle: Text(usuarios[index].email),
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(usuarios[index].nombre.substring(0,2)),
        ),
        trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: usuarios[index].omline ? Colors.green[300] : Colors.red
          ),
        ),
      )), 
      separatorBuilder: ((context, index) => const Divider()), 
      itemCount: usuarios.length);
  }
}