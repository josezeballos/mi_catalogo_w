import 'package:flutter/material.dart';
import 'package:mi_catalogo_w/vistas/lista_producto_vista.dart';
import 'package:mi_catalogo_w/vistas/nuevo_producto_vista.dart';

import '../malla_vista.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        const DrawerHeader(
          child: Center(
            child: Text('Menu'),
          ),
        ),
        Flexible(
            child: ListView(
          children: [
            ListTile(
              title: Text('Crear Producto'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_right),
                onPressed: () => Navigator.pushNamed(
                    context, const NuevoProductoVista().routName),
              ),
            ),
            ListTile(
              title: const Text('malla'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_right),
                onPressed: () => Navigator.pushReplacementNamed(
                    context, const MallaVista().routName),
              ),
            ),
            ListTile(
              title: const Text('lista'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_right),
                onPressed: () => Navigator.pushReplacementNamed(
                    context, const ListaProductoVista().routName),
              ),
            )
          ],
        )),
      ],
    ));
  }
}
