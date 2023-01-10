import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mi_catalogo_w/modelo/producto_catalogo_modelo.dart';
import 'package:mi_catalogo_w/vistas/detalles_producto_vista.dart';
import 'package:mi_catalogo_w/vistas/widgets/menu_widget.dart';
import 'package:mi_catalogo_w/vistas/widgets/productotile_widget.dart';

class ListaProductoVista extends StatefulWidget {
  const ListaProductoVista({Key? key}) : super(key: key);
  final String routName = 'ListaProductoVista';

  @override
  State<ListaProductoVista> createState() => _ListaProductoVistaState();
}

class _ListaProductoVistaState extends State<ListaProductoVista> {
  DatabaseReference starCountRef = FirebaseDatabase.instance.ref('miCatalogo');
  List<ProductoCatalogoModelo> producto = [];
  listenProduct() async {
    final uid = await FlutterSecureStorage().read(key: 'uid');
    starCountRef.child(uid!).onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map;
      producto.clear();
      data.forEach((key, value) {
        producto.add(ProductoCatalogoModelo(
            img: value['img'],
            nombre: value['nombre'],
            precio: double.parse(value['precio'].toString()),
            descripcion: value['descripcion']));
        print(producto);
        setState(() {});
      });
      // final prod = productoCatalogoModeloFromJson(data);
    });
  }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listenProduct();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuWidget(),
      appBar: AppBar(
        title: Text('Lista Productos'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final item = producto[index];

          return ProductoTileWidget(
            imagen: item.img,
            nombre: item.nombre,
            precio: item.precio.toString(),
            onPressed: () =>
                Navigator.pushNamed(context, DetallesProductoVista().routName, arguments: item),
          );
        },
        itemCount: producto.length,
      ),
    );
  }
}
