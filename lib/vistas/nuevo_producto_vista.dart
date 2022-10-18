import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mi_catalogo_w/vistas/widgets/menu_widget.dart';

import '../modelo/producto_catalogo_modelo.dart';

class NuevoProductoVista extends StatefulWidget {
  const NuevoProductoVista({Key? key}) : super(key: key);
  final String routName = 'NuevoProductoVista';

  @override
  State<NuevoProductoVista> createState() => _NuevoProductoVistaState();
}

class _NuevoProductoVistaState extends State<NuevoProductoVista> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  final nombre = TextEditingController();
  final precio = TextEditingController();
  final descripcion = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo Producto'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.lime, border: Border.all(width: 3)),
                alignment: Alignment.center,
                child: image == null
                    ? const Text('seleccionar foto')
                    : Image(
                        image: FileImage(File(image!.path)),
                        fit: BoxFit.contain,
                      ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {});
                    print(image!.path);
                  },
                  child: Text('Agregar')),
              TextField(
                controller: nombre,
                decoration: const InputDecoration(labelText: 'nombre'),
              ),
              TextField(
                controller: precio,
                decoration: const InputDecoration(labelText: 'precio'),
              ),
              TextField(
                controller: descripcion,
                decoration: const InputDecoration(labelText: 'descripcion'),
              ),
              ElevatedButton(
                  onPressed: () async{
                    try {
                      print('********************${image!.path}');
                      final uid = await const FlutterSecureStorage().read(key: 'uid');
                      final storage = FirebaseStorage.instance.ref();
                      //esto crea la ruta de referencia  del archivo en firebase storage
                      final rutaRef = storage.child('miCatalogo/${uid}/${nombre.text}/');
                      print('*///////////////////////${rutaRef}');

                      //carga el archivo en firebase
                      await rutaRef.child(image!.name).putFile(File(image!.path));
                      final img=await rutaRef.child(image!.name).getDownloadURL();
                      print('*////-------///////////////////${img}');

                      await ProductoCatalogoModelo(
                              img: img,
                              nombre: nombre.text,
                              precio: double.parse(precio.text),
                              descripcion: descripcion.text)
                          .guardarProducto();
                      if (!mounted) return;
                      Navigator.pop(context);
                    } catch (e, s) {
                      print(s);
                    }
                  },
                  child: Text('guardar'))
            ],
          ),
        ),
      ),
    );
  }
}
