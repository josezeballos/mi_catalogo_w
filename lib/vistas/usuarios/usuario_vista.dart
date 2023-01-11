import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mi_catalogo_w/vistas/usuarios/iniciar_con_telefono_vista.dart';
import 'package:mi_catalogo_w/vistas/usuarios/perfil_usuario_vista.dart';

import '../home_vista.dart';

class UsuarioVista extends StatefulWidget {
  final String routName = 'UsuarioVista';
  const UsuarioVista({Key? key}) : super(key: key);

  @override
  State<UsuarioVista> createState() => _UsuarioVistaState();
}

class _UsuarioVistaState extends State<UsuarioVista> {
  final user = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: user.readAll(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final uid = snapshot.data as Map;
          if(uid.isEmpty){return IniciarConTelefonoVista();}
          print('+++++++++++++++gfd+++++++++++++${uid}');
          return  PerfilUsuarioVista(uid: uid);

        }
        return const Center(child: CircularProgressIndicator());
      },
    );




    // );
  }
}
