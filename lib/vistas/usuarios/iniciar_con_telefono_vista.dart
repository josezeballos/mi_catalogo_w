import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home_vista.dart';

class IniciarConTelefonoVista extends StatefulWidget {

  final String routName = 'IniciarConTelefonoVista';
  IniciarConTelefonoVista({Key? key}) : super(key: key);

  @override
  State<IniciarConTelefonoVista> createState() => _IniciarConTelefonoVistaState();
}

class _IniciarConTelefonoVistaState extends State<IniciarConTelefonoVista> {

  String smsCode = '';

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
              keyboardType: TextInputType.phone,
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                if (telefono.text.isNotEmpty) {
                  FirebaseAuth auth = FirebaseAuth.instance;
                  await auth.verifyPhoneNumber(
                    phoneNumber: telefono.text,
                    verificationCompleted:
                        (PhoneAuthCredential credential) async {
                      await auth.signInWithCredential(credential);
                    },
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) async {
                      await _dialogBuilder(context);
                      print('******************************$smsCode');
                      try {
                        if (smsCode.isNotEmpty) {
                          PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: verificationId, smsCode: smsCode);

                          await auth.signInWithCredential(credential);
                          if(!mounted)return;
                          Navigator.pushReplacementNamed(context, const HomeVista().routName);

                        }
                      }catch (e) {
                        print('****/////////**********$e');
                      }

                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                }
              },
              child: Text('entrar'))
        ],
      ),
    ));
  }

  Future<void> _dialogBuilder(BuildContext context) {
    final sms = TextEditingController();
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ingresar codigo SMS'),
          content: Center(
              child: TextField(
                keyboardType: TextInputType.number,
            controller: sms,
          )),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Enviar'),
              onPressed: () {
                if (sms.text.isNotEmpty) {
                  smsCode = sms.text;
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
