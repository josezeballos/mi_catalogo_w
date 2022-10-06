// To parse this JSON data, do
//
//     final usuarioModelo = usuarioModeloFromJson(jsonString);

import 'dart:convert';

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
}
