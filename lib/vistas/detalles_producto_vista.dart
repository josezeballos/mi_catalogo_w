import 'package:flutter/material.dart';
import 'package:mi_catalogo_w/modelo/producto_catalogo_modelo.dart';

class DetallesProductoVista extends StatelessWidget {
  const DetallesProductoVista({Key? key}) : super(key: key);
final String routName='DetallesProductoVista';


  @override
  Widget build(BuildContext context) {
    final producto = ModalRoute.of(context)!.settings.arguments as ProductoCatalogoModelo;
    return Scaffold(
      appBar: AppBar(title: Text(producto.nombre),),

    );
  }
}
