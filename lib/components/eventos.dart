import 'package:flutter/widgets.dart';
import 'package:meu_app/components/item_evento.dart';
import 'evento.dart';

class Eventos extends StatelessWidget {
  final List<Evento> eventos;
  final void Function(String) remove;

  const Eventos(this.eventos, this.remove);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: eventos.length,
      itemBuilder: (ctx, index) {
        final ev = eventos[index];
        return EventoItem(
          ev: ev,
          remove: remove,
        );
      },
    );
  }
}
