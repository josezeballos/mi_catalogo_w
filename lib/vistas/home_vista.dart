import 'package:flutter/material.dart';
import 'package:mi_catalogo_w/vistas/widgets/menu_widget.dart';


class HomeVista extends StatelessWidget {
  const HomeVista({Key? key}) : super(key: key);
  final String routName = 'HomeVista';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.add_box),
          actions: [
            Container(

              child: TextField(decoration: InputDecoration(icon: Icon(Icons.search),hintText: 'Buscar para cotizar ya'),),
              margin: EdgeInsets.all(5),
              width: 230,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50)) ,
            )
          ],
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.qr_code), text: 'Catalogo'),
            Tab(icon: Icon(Icons.perm_identity),text: 'Mi cuenta'),
          ]),
        ),
        drawer: const MenuWidget(),
      ),
    );
  }
}
