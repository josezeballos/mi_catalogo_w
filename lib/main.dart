import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mi_catalogo_w/firebase_options.dart';
import 'package:mi_catalogo_w/servicios/indexs.dart';
import 'package:mi_catalogo_w/vistas/catalogo_general/informacion_producto_vista.dart';
import 'package:mi_catalogo_w/vistas/detalles_producto_vista.dart';
import 'package:mi_catalogo_w/vistas/home_vista.dart';
import 'package:mi_catalogo_w/vistas/lista_producto_vista.dart';
import 'package:mi_catalogo_w/vistas/malla_vista.dart';
import 'package:mi_catalogo_w/vistas/nuevo_producto_vista.dart';
import 'package:mi_catalogo_w/vistas/usuarios/iniciar_con_telefono_vista.dart';
import 'package:mi_catalogo_w/vistas/usuarios/perfil_usuario_vista.dart';
import 'package:mi_catalogo_w/vistas/usuarios/usuario_vista.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider<Index>(create: (contex) => Index()),
      ],
      child: MaterialApp( //widget padre de la app
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.lightBlue,
        ),
        initialRoute: const  HomeVista().routName,
        routes: {
          const HomeVista().routName:(context) => const HomeVista(),
          const MallaVista().routName:(context) => const MallaVista(),
          const NuevoProductoVista().routName:(context) => const NuevoProductoVista(),
          const ListaProductoVista().routName:(context) => const ListaProductoVista(),
          const DetallesProductoVista().routName:(context) => const DetallesProductoVista(),
          IniciarConTelefonoVista().routName:(context) => IniciarConTelefonoVista(),
          InformacionProductoVista().routName:(context) => InformacionProductoVista(),
          UsuarioVista().routName:(context) => UsuarioVista(),
          PerfilUsuarioVista(uid: {},).routName:(context) => PerfilUsuarioVista(uid: {}),



        }
      ),
    );
  }
}
