import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mi_catalogo_w/herramientas/generador_de_codigo.dart';
import 'package:mi_catalogo_w/modelo/producto_catalogo_modelo.dart';

class DetallesProductoVista extends StatelessWidget {
  const DetallesProductoVista({Key? key}) : super(key: key);
  final String routName = 'DetallesProductoVista';

  @override
  Widget build(BuildContext context) {
    final producto =
        ModalRoute.of(context)!.settings.arguments as ProductoCatalogoModelo;
    return Scaffold(
        appBar: AppBar(
          title: Text(producto.nombre),
        ),
        body: ListView(
          children: [
            SizedBox(
                height: 300,
                child:
                    Image(image: NetworkImage(producto.img))),
            Text(producto.nombre),
            Text('${producto.precio}'),
            Text(producto.descripcion!),
            ElevatedButton(
                onPressed: () async {
                  final database = FirebaseDatabase.instance;
                  producto.codigoKey = generadorDeCodigo();
                  await database.ref("productosEnRevision").child(producto.codigoKey!).set(producto.toJson());

                },
                child: Text('Publicar'))
          ],
        ));
  }
}
