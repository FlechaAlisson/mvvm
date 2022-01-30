import 'package:mvvm_arch/src/home/person.model.dart';
import 'package:rx_notifier/rx_notifier.dart';

class HomeControllerViewModel {
  double _altura = 0;
  double _peso = 0;

  final RxNotifier<String> _result = RxNotifier('');

  void setPeso(String value) => _peso = double.tryParse(value) ?? 0;

  void setAltura(String value) => _altura = double.tryParse(value) ?? 0;

  String get result => _result.value;

  void calculateImc() {
    final value = PersonModel(altura: _altura, peso: _peso).getImc();
    if (_altura == 0 || _peso == 0) {
      _result.value = 'Coloque valores válidos.';
    } else if (value < 18) {
      _result.value = 'Abaixo do peso. IMC: ${value.toStringAsFixed(1)}';
    } else if (value > 18 && value < 25) {
      _result.value = 'Peso Ideal. IMC: ${value.toStringAsFixed(1)}';
    } else {
      _result.value = 'Acima do peso. IMC: ${value.toStringAsFixed(1)}';
    }
  }
}
