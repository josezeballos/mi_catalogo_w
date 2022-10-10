import 'package:flutter/material.dart';

class BuscadorWidget extends StatelessWidget {
  const BuscadorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const TextField(
        decoration: InputDecoration(
            icon: const Icon(Icons.search),
            hintText: 'Buscar para cotizar ya'),
      ),
      margin: const EdgeInsets.all(5),
      width: 230,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50)),
    );
  }
}
