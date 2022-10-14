// To parse this JSON data, do
//
//     final usuarioModelo = usuarioModeloFromJson(jsonString);

import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

UsuarioModelo usuarioModeloFromJson(String str) => UsuarioModelo.fromJson(json.decode(str));

String usuarioModeloToJson(UsuarioModelo data) => json.encode(data.toJson());

class UsuarioModelo {
  UsuarioModelo({
    this.uid,
    this.nombreCompleto,
    this.numeroTelefono,
  });

  String? uid;
  String? nombreCompleto;
  String? numeroTelefono;

  factory UsuarioModelo.fromJson(Map<String, dynamic> json) => UsuarioModelo(
    uid: json["uid"],
    nombreCompleto: json["nombreCompleto"],
    numeroTelefono: json["numeroTelefono"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "nombreCompleto": nombreCompleto,
    "numeroTelefono": numeroTelefono,
  };
  Future<void>guardarUsuario() async {
    final database = FirebaseDatabase.instance;
    await database.ref("usuarios").child(uid!).set(toJson());
  }
}
