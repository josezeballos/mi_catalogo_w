import 'package:flutter/material.dart';

class ProductoTileWidget extends StatelessWidget {
  String nombre;
  String precio;
  String imagen;
  VoidCallback onPressed;

   ProductoTileWidget(
      {Key? key,
      required this.nombre,
      required this.precio,
      required this.imagen,
        required this.onPressed
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 500,
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(color: Colors.lime),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nombre),
              Text(precio),
            ],
          ),
          IconButton(onPressed: onPressed
              , icon: Icon(Icons.add_business))
        ],
      ),
    );
  }
}
