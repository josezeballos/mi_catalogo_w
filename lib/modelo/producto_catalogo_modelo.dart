// To parse this JSON data, do
//
//     final productoCatalogoModelo = productoCatalogoModeloFromJson(jsonString);

import 'dart:convert';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

ProductoCatalogoModelo productoCatalogoModeloFromJson(String str) =>
    ProductoCatalogoModelo.fromJson(json.decode(str));

String productoCatalogoModeloToJson(ProductoCatalogoModelo data) =>
    json.encode(data.toJson());

///clase modelo del producto
class ProductoCatalogoModelo {
  ProductoCatalogoModelo({
    required this.img,
    required this.nombre,
    required this.precio,
    this.descripcion,
  });

  String img;
  String nombre;
  double precio;
  String? descripcion;

  final database = FirebaseDatabase.instance;

  factory ProductoCatalogoModelo.fromJson(Map<String, dynamic> json) =>
      ProductoCatalogoModelo(
        img: json["img"],
        nombre: json["nombre"],
        precio: json["precio"].toDouble(),
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toJson() => {
        "img": img,
        "nombre": nombre,
        "precio": precio,
        "descripcion": descripcion,
      };

  guardarProducto() async {
    final storage = FirebaseStorage.instance.ref();
    final spaceRef = storage.child("images/");
    File file = File(img);

    try {
      img = await spaceRef.putFile(file).snapshot.ref.getDownloadURL();
      await database.ref("productos").child(nombre).set(toJson());
      print(toString());
    } catch (error) {
      print(error);
    }
  }

  @override
  String toString() {
    return 'ProductoCatalogoModelo{img: $img ,\n nombre: $nombre,\n precio: $precio,\n descripcion: $descripcion}';
  }
}
