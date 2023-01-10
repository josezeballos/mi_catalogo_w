import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mi_catalogo_w/modelo/producto_catalogo_modelo.dart';
import 'package:mi_catalogo_w/vistas/catalogo_general/informacion_producto_vista.dart';
import 'package:mi_catalogo_w/vistas/detalles_producto_vista.dart';
import 'package:mi_catalogo_w/vistas/widgets/menu_widget.dart';

import 'lista_producto_vista.dart';

class MallaVista extends StatefulWidget {
  const MallaVista({Key? key}) : super(key: key);
  final String routName = 'MallaVista';

  @override
  State<MallaVista> createState() => _MallaVistaState();
}

///
/// jhgdjwcdc
///
/// wedcwedc
class _MallaVistaState extends State<MallaVista> {
  List<ProductoCatalogoModelo> producto = [];

  List<NavigationRailDestination> categorias = List.generate(
    21,
    (index) => NavigationRailDestination(
        icon: Icon(Icons.add_box_outlined), label: Text('item $index')),
  );
  int _selecteIndex = 0;


  listenProduct() async {
  final uid = await FlutterSecureStorage().read(key: 'uid'); //captura el uid del usuario desde el dispositivo

  // final FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference starCountRef = FirebaseDatabase.instance.ref('catalogoGeneral');
    starCountRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map;
      producto.clear();
      data.forEach((key, value) {
        producto.add(ProductoCatalogoModelo(
            img: value['img'],
            nombre: value['nombre'],
            precio: double.parse(value['precio'].toString()),
            descripcion: value['descripcion'],
          codigoKey: value['codigoKey'],
        ));

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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_business),
        onPressed: () async {

        },
      ),
      appBar: AppBar(
        title: const Text('MallaVista'),
      ),
      drawer: const MenuWidget(),
      body: Row(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                controller: ScrollController(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: NavigationRail(
                        labelType: NavigationRailLabelType.all,
                        onDestinationSelected: (value) {
                          setState(() {
                            _selecteIndex = value;
                          });
                        },
                        destinations: categorias,
                        selectedIndex: _selecteIndex),
                  ),
                ),
              );
            },
          ),
          Flexible(
            child: GridView.builder(reverse: true,
              controller: ScrollController(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 15 / 15,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: producto.length,
              itemBuilder: (context, index) {
                return GestureDetector( //widget para reconocer gestos de las pantallas
                  onTap: () {

                    Navigator.pushNamed(context, InformacionProductoVista().routName, arguments: producto[index]);

                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: Colors.black26)),
                    child: Column(
                      children: [
                        Expanded(child: Image(image: NetworkImage(producto[index].img))),
                        Text(producto[index].nombre),
                        Text('${producto[index].precio}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
