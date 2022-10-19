
import 'dart:math';

String generadorDeCodigo(){
  var r = Random();
  const caracter = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789';
  return List.generate(15, (index) => caracter[r.nextInt(caracter.length)]).join();
}

// void main() {
// for (int i=0;i<10;i++) {
//   print(generadorDeCodigo());
// }
//
// }