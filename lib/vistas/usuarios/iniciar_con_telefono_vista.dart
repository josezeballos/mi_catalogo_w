import 'package:flutter/material.dart';

class IniciarConTelefonoVista extends StatelessWidget {
  final String routName = 'IniciarConTelefonoVista';

  const IniciarConTelefonoVista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final telefono = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Intégrate a Contizar Ya, con un numero de telefono'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: telefono,

              ),
            ),
        ElevatedButton(onPressed: (){}, child: Text('entrar'))

          ],
        ),
      )

    );
  }
}
