import 'dart:math' as math;

class PersonModel {
  double? altura;
  double? peso;

  PersonModel({this.altura, this.peso});

  double getImc() {
    return ((peso ?? 0) / math.pow((altura ?? 0), 2));
  }
}
