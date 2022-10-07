import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../home_vista.dart';

class UsuarioVista extends StatefulWidget {
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
          print('++++++++++++++++++$uid');
          return Scaffold(
            body: Column(children: [
              Center(child: Text('Nombre: ${uid['uid']}')),
              Center(child: Text('Telefono${uid['numeroTelefono']}'),),
              Center(child: Text('Codigo${uid['numeroTelefono']}'),),
              ElevatedButton(onPressed: () async {
                FirebaseAuth auth = FirebaseAuth.instance;
                try{
                await user.deleteAll();

                await auth.signOut();
                setState(() {

                });
                if(!mounted)return;
                Navigator.pushReplacementNamed(context, const HomeVista().routName);

                }catch (error){
                  print(error);
                }
              }, child: Text('cerrar sesion'))
            ],));

        }
        return const Center(child: CircularProgressIndicator());
      },
    );




    // );
  }
}
