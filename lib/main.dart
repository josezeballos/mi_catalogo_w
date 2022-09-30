import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mi_catalogo_w/firebase_options.dart';
import 'package:mi_catalogo_w/vistas/detalles_producto_vista.dart';
import 'package:mi_catalogo_w/vistas/home_vista.dart';
import 'package:mi_catalogo_w/vistas/lista_producto_vista.dart';
import 'package:mi_catalogo_w/vistas/malla_vista.dart';
import 'package:mi_catalogo_w/vistas/nuevo_producto_vista.dart';
import 'package:mi_catalogo_w/vistas/usuarios/iniciar_con_telefono_vista.dart';

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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.yellow,
      ),
      initialRoute: const  MallaVista().routName,
      routes: {
        const HomeVista().routName:(context) => const HomeVista(),
        const MallaVista().routName:(context) => const MallaVista(),
        const NuevoProductoVista().routName:(context) => const NuevoProductoVista(),
        const ListaProductoVista().routName:(context) => const ListaProductoVista(),
        const DetallesProductoVista().routName:(context) => const DetallesProductoVista(),
        const IniciarConTelefonoVista().routName:(context) => const IniciarConTelefonoVista(),



      }
    );
  }
}
