import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mi_catalogo_w/modelo/producto_catalogo_modelo.dart';

class InformacionProductoVista extends StatelessWidget {
  const InformacionProductoVista({Key? key}) : super(key: key);
  final String routName = 'InformacionProductoVista';

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
                onPressed: null,
                child: Text('Cotizar'))
          ],
        ));
  }
}
