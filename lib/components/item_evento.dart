import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'evento.dart';

class EventoItem extends StatelessWidget {
  final Evento ev;
  final void Function(String id) remove;

  EventoItem({required this.ev, required this.remove});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text(ev.titulo),
        subtitle: Text(DateFormat('d/MM/y').format(ev.data)),
        trailing: IconButton(
          onPressed: () => remove(ev.id),
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}
