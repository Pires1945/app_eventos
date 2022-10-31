import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  final void Function(String, DateTime) onSubmit;

  Formulario(this.onSubmit);

  @override
  State<StatefulWidget> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _tituloController = TextEditingController();
  var _dataSelecionada = DateTime.now();

  _submit() {
    final titulo = _tituloController.text;

    widget.onSubmit(titulo, _dataSelecionada);
  }

  _mostrarDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      _dataSelecionada = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            controller: _tituloController,
            onSubmitted: (_) => (_submit()),
            decoration: InputDecoration(
              labelText: 'Título',
            ),
          ),
          ElevatedButton(
            onPressed: () => _mostrarDatePicker(context),
            child: Text('Selecionar data'),
          ),
          ElevatedButton(
            onPressed: _submit,
            child: Text('Salvar'),
          )
        ],
      ),
    );
  }
}
