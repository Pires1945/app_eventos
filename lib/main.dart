import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meu_app/components/evento.dart';
import 'package:meu_app/components/eventos.dart';
import 'package:meu_app/components/novo_evento.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Evento> _evento = [];

  _addEvento(String titulo, DateTime data) {
    final novoEvento = Evento(
      id: Random().nextDouble().toString(),
      titulo: titulo,
      data: data,
    );

    setState(() {
      _evento.add(novoEvento);
    });

    Navigator.of(context).pop();
  }

  _removeEvento(String id) {
    setState(() {
      _evento.removeWhere((e) => e.id == id);
    });
  }

  _abrirModalFormulario(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Formulario(_addEvento);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda'),
        actions: [],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 650,
              child: Eventos(_evento, _removeEvento),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _abrirModalFormulario(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
