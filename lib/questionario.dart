import 'package:flutter/material.dart';

import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.responder
  });

  bool get hasSelectedQuestion {
    return perguntaSelecionada < perguntas.length;
  }

  @override 
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = hasSelectedQuestion ?
     perguntas[perguntaSelecionada]['answer'] : null;
    
    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['text']),
        ...respostas.map((resp) => Resposta(resp['text'], () => responder(resp['nota'])))
      ],
    );
  }
}