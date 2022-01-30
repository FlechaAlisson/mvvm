import 'package:flutter/material.dart';
import 'package:mvvm_arch/src/home/home.controller.dart';
import 'package:rx_notifier/rx_notifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeControllerViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculo IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Altura"),
              ),
              onChanged: controller.setAltura,
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Peso'),
              ),
              onChanged: controller.setPeso,
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            RxBuilder(
              builder: (_) => Text(controller.result),
            )
          ],
        ),
      ),
      floatingActionButton: _button(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _button() {
    return Container(
      width: MediaQuery.of(context).size.width - 100,
      child: ElevatedButton(
        onPressed: () {
          controller.calculateImc();
        },
        child: const Text('Calcular'),
      ),
    );
  }
}
