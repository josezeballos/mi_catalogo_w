import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mi_catalogo_w/vistas/widgets/menu_widget.dart';


class HomeVista extends StatefulWidget {
  const HomeVista({Key? key}) : super(key: key);
  final String routName = 'HomeVista';

  @override
  State<HomeVista> createState() => _HomeVistaState();
}

class _HomeVistaState extends State<HomeVista> {
  final user = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.add_box),
          actions: [
            Container(

              child: const TextField(decoration: InputDecoration(icon: const Icon(Icons.search),hintText: 'Buscar para cotizar ya'),),
              margin: const EdgeInsets.all(5),
              width: 230,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)) ,
            )
          ],
          bottom: const TabBar(tabs: [
            const Tab(icon: const Icon(Icons.qr_code), text: 'Catalogo'),
            Tab(icon: const Icon(Icons.perm_identity),text: 'Mi cuenta'),
          ]),
        ),
        drawer: const MenuWidget(),
        body: FutureBuilder(
          future: user.readAll(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final uid= snapshot.data;
              return Text('${uid}');
            }
            return const Center(child: CircularProgressIndicator());
          },
        )
      ),
    );
  }
}
