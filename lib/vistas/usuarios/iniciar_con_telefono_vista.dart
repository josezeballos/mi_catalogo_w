import 'package:firebase_auth/firebase_auth.dart';
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
              ElevatedButton(onPressed: () async {
                if (telefono.text.isNotEmpty) {
                  FirebaseAuth auth = FirebaseAuth.instance;
                  await auth.verifyPhoneNumber(
                    phoneNumber: telefono.text,
                    verificationCompleted: (
                        PhoneAuthCredential credential) async {
                      await auth.signInWithCredential(credential);
                    },
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) async {
                      String smsCode = '123456';


                      PhoneAuthCredential credential =
                      PhoneAuthProvider.credential(
                          verificationId: verificationId, smsCode: smsCode);

                      await auth.signInWithCredential(credential);
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                }
              }, child: Text('entrar'))

            ],
          ),
        )

    );
  }
}
