import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mi_catalogo_w/firebase_options.dart';
import 'package:mi_catalogo_w/vistas/detalles_producto_vista.dart';
import 'package:mi_catalogo_w/vistas/home_vista.dart';
import 'package:mi_catalogo_w/vistas/lista_producto_vista.dart';
import 'package:mi_catalogo_w/vistas/malla_vista.dart';
import 'package:mi_catalogo_w/vistas/nuevo_producto_vista.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.yellow,
      ),
      initialRoute: const  MallaVista().routName,
      routes: {
        const HomeVista().routName:(context) => const HomeVista(),
        const MallaVista().routName:(context) => const MallaVista(),
        const NuevoProductoVista().routName:(context) => const NuevoProductoVista(),
        const ListaProductoVista().routName:(context) => const ListaProductoVista(),
        const DetallesProductoVista().routName:(context) => const DetallesProductoVista(),


      }
    );
  }
}
