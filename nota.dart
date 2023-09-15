import 'dart:io';

void main(List<String> args) {
  // Solicitar la cantidad de notas tomadas
  int cantidadNotas = preguntador('Ingrese la cantidad de notas tomadas: ', 1);

  // Crear las listas vacías
  List<double> notas = [];
  List<double> porcentajes = [];

  // Paso 3: ingresar las notas y porcentajes
  for (int i = 0; i < cantidadNotas; i++) {
    double nota = preguntador('Ingrese la nota ${i + 1}: ', 2);
    notas.add(nota);

    double porcentaje =
        preguntador('Ingrese el porcentaje de la nota ${i + 1}: ', 2);
    porcentajes.add(porcentaje);
  }

// Verificar si la suma de los porcentajes es igual a 100%
  double sumaPorcentajes = porcentajes.reduce((a, b) => a + b);
  if (sumaPorcentajes != 100.0) {
    print('La suma de los porcentajes debe ser igual a 100%.');
    print(
        'Necesita agregar un porcentaje adicional del ${100 - sumaPorcentajes}% para completar el 100%.');
  }

// Calcular la nota final
  double notaFinal = 0;
  for (int i = 0; i < cantidadNotas; i++) {
    double notaPonderada = (notas[i] * porcentajes[i]) / 100;
    notaFinal += notaPonderada;
  }

  if (notaFinal >= 3) {
    // Imprimir la nota final
    print('Felicidades, pasaste la materia en: $notaFinal');
  } else {
    print('Lo siento, perdiste la materia en: $notaFinal');
  }
}

//Función para preguntar
dynamic preguntador(String? pregunta, int type) {
  print(pregunta);
  String? dato = stdin.readLineSync();

  switch (type) {
    case 1: //Espera un int
      try {
        return int.parse(dato ?? '0');
      } on FormatException {
        return 0;
      }
    case 2: //Espera un double
      return double.parse(dato ?? '0.0');
    case 3: //Espera un String de nombre
      return dato ?? 'NoName';
    case 4: //Espera un String de siglo
      return dato ?? 'XVIII';
    default: //Espera un String cualquiera
      return dato ?? '';
  }
}
