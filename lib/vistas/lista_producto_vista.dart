import 'package:flutter/material.dart';
import 'package:mi_catalogo_w/vistas/detalles_producto_vista.dart';
import 'package:mi_catalogo_w/vistas/widgets/productotile_widget.dart';

class ListaProductoVista extends StatefulWidget {
  const ListaProductoVista({Key? key}) : super(key: key);
  final String routName = 'ListaProductoVista';

  @override
  State<ListaProductoVista> createState() => _ListaProductoVistaState();
}

class _ListaProductoVistaState extends State<ListaProductoVista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Productos'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ProductoTileWidget(
            imagen: 'asd',
            nombre: 'producto $index',
            precio: (index * 4).toString(),
            onPressed: () =>
                Navigator.pushNamed(context, DetallesProductoVista().routName),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
