import 'package:flutter/material.dart';
import 'package:projeto_quiz/resultado.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  final _perguntas = const [
    {
      'texto': "What's your favorite color?",
      'respostas': [
        {'texto': 'Orange', 'pontuacao': 5},
        {'texto': 'Blue', 'pontuacao': 10},
        {'texto': 'Black', 'pontuacao': 3},
        {'texto': 'Red', 'pontuacao': 2},
      ]
    },
    {
      'texto': "What's your favorite pet?",
      'respostas': [
        {'texto': 'Lion', 'pontuacao': 3},
        {'texto': 'Cat', 'pontuacao': 5},
        {'texto': 'Dog', 'pontuacao': 4},
        {'texto': 'Bird', 'pontuacao': 10},
      ]
    },
    {
      'texto': "What's your favorite fast food?",
      'respostas': [
        {'texto': 'Hot Dog', 'pontuacao': 10},
        {'texto': 'Pizza', 'pontuacao': 2},
        {'texto': 'Hamburguer', 'pontuacao': 3},
        {'texto': 'Sandwich', 'pontuacao': 4}
      ]
    },
  ];

  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  void _responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get hasQuestionSelected {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: hasQuestionSelected
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
