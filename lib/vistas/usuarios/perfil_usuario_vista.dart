import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mi_catalogo_w/vistas/home_vista.dart';
import 'package:mi_catalogo_w/vistas/widgets/menu_widget.dart';

class PerfilUsuarioVista extends StatefulWidget {
  const PerfilUsuarioVista({Key? key, required this.uid}) : super(key: key);
  final Map uid;
  final String routName = 'PerfilUsuarioVista';

  @override
  State<PerfilUsuarioVista> createState() => _PerfilUsuarioVistaState();
}

class _PerfilUsuarioVistaState extends State<PerfilUsuarioVista> {

  @override
  Widget build(BuildContext context) {
  final uid = widget.uid;

    return Scaffold(
      appBar: AppBar(title: const Text('Mi Perfil'), centerTitle: true),
        drawer: const MenuWidget(),

        body: Column(children: [
          Center(child: Text('Nombre: ${uid['uid']}')),
          Center(child: Text('Telefono${uid['numeroTelefono']}'),),
          Center(child: Text('Codigo${uid['numeroTelefono']}'),),
          ElevatedButton(onPressed: () async {
            FirebaseAuth auth = FirebaseAuth.instance;
            try{
              const user =  FlutterSecureStorage();
              await user.readAll();
              await user.deleteAll();

              await auth.signOut();
              setState(() {

              });
              if(!mounted)return;
              Navigator.pushNamedAndRemoveUntil(context, const HomeVista().routName, (route) => false,);

            }catch (error){
              throw Exception(error);
            }
          }, child: const Text('cerrar sesion'))
        ],));
  }
}
