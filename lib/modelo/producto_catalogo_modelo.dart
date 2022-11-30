// To parse this JSON data, do
//
//     final productoCatalogoModelo = productoCatalogoModeloFromJson(jsonString);

import 'dart:convert';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
    this.codigoKey
  });

  String img;
  String nombre;
  double precio;
  String? descripcion;
  String? codigoKey;

  final database = FirebaseDatabase.instance;

  factory ProductoCatalogoModelo.fromJson(Map<String, dynamic> json) =>
      ProductoCatalogoModelo(
        img: json["img"],
        nombre: json["nombre"],
        precio: json["precio"].toDouble(),
        descripcion: json["descripcion"],
        codigoKey: json["codigoKey"],
      );

  Map<String, dynamic> toJson() => {
        "img": img,
        "nombre": nombre,
        "precio": precio,
        "descripcion": descripcion,
        "codigoKey": codigoKey,
      };

  Future<void> guardarProducto() async {
    //Carga archivos en l storge de firebase
    try {
      print('********guardarProducto imagen url***: ${img}');
      //fin carga archivos
      //extrae la uid del usuario de la memoria del telefono
      final uid = await const FlutterSecureStorage().read(key: 'uid');

      print('*///////////////////////${toString()}');
      await database.ref("miCatalogo").child(uid!).child(nombre).set(toJson());
      print(toString());
    } catch (error) {
      print('********guardarProducto catch***: $error');
    }
  }

  @override
  String toString() {
    return 'ProductoCatalogoModelo{img: $img ,\n nombre: $nombre,\n precio: $precio,\n descripcion: $descripcion, \n codigoKey: $codigoKey}';
  }
}
