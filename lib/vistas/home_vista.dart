import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mi_catalogo_w/servicios/indexs.dart';
import 'package:mi_catalogo_w/vistas/usuarios/iniciar_con_telefono_vista.dart';
import 'package:mi_catalogo_w/vistas/usuarios/usuario_vista.dart';
import 'package:mi_catalogo_w/vistas/widgets/buscador_widget.dart';
import 'package:mi_catalogo_w/vistas/widgets/menu_widget.dart';
import 'package:provider/provider.dart';

import 'malla_vista.dart';

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
    final index = Provider.of<Index>(context);
    return DefaultTabController(
      initialIndex: index.indexTabBar,

      length: 2,
      child: Scaffold(
          appBar: AppBar(
            leading: Image.asset('asset/logo.png', height: 300),
            actions: [
              BuscadorWidget(),
              // IconButton(onPressed: (){}, icon: Icon(Icons.search)),
              IconButton(onPressed: (){

                Navigator.pushNamed(context, IniciarConTelefonoVista().routName);
                }, icon: Icon(Icons.person)),

            ],
            bottom: TabBar(
              onTap: (value)=>index.indexTabBar=value,

              tabs: [
                const Tab(icon: const Icon(Icons.add_business), text: 'Catalogo'),
                Tab(
                  icon: const Icon(Icons.edit),
                  text: 'Vender',
                ),
              ],
            ),
          ),
          drawer: const MenuWidget(),
          body: PageView(
            //physics: const NeverScrollableScrollPhysics(),
            controller: index.pageController,
            children: [
              MallaVista(),
              Scaffold(
                  body: Center(
                child: Text('Catalogo'),
              )),
              FutureBuilder(
                  future: user.readAll(), builder: (context, snapshot) {
                      print(snapshot.hasData);
                    if(
                    snapshot.hasData
                    ){
                      final data = snapshot.data as Map;
                      if(data.isNotEmpty)
                      return UsuarioVista();
                    }

                    return IniciarConTelefonoVista();
              }),
            ],
          )),
    );
  }
}
