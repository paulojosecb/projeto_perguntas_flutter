import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  var _pontuacao = 0;

  final List<Map<String, Object>> _perguntas = const [
  {
    'text': "Qual sua cor favorita?",
    'answer': [
      {"text": "Preto", "nota": 10 },
      {"text": "Amarelo", "nota": 5 },
      {"text": "Vermelho", "nota": 1 },
    ]
  },
  {
    'text': "Qual seu animal favorito?",
    'answer': [
      {"text": "Coelho", "nota": 10 },
      {"text": "Gato", "nota": 5 },
      {"text": "Cachorro", "nota": 1 },
    ]
  }];

  void _responder(int pont) {
    setState(() => _perguntaSelecionada++);
    print("Pergunta respondida");

    _pontuacao += pont;

    print(_pontuacao);
  }

  bool get hasSelectedQuestion {
    return _perguntaSelecionada < _perguntas.length;
  }

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas')
        ),
        body: hasSelectedQuestion ? Questionario(
          perguntas: _perguntas,
          perguntaSelecionada: _perguntaSelecionada,
          responder: _responder
        ) : Resultado()
      ),
    );
  }

}
class PerguntaApp extends StatefulWidget{

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState(); 
  }

}