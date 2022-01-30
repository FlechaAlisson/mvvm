import 'package:mvvm_arch/src/home/person.model.dart';
import "package:test/test.dart";

void main(List<String> args) {
  test('O IMC deve ser 24', () {
    final PersonModel personModel = PersonModel(peso: 70, altura: 1.7);
    expect(personModel.getImc().round(), 24);
  });
}
