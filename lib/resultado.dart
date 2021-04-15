import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestionario;

  Resultado(this.pontuacao, this.reiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Shame on you!';
    } else if (pontuacao < 16) {
      return 'You are good!';
    } else {
      return 'Congratulations!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
          fraseResultado,
          style: TextStyle(
            fontSize: 28,
          ),
        )),
        TextButton(
          child: Text('Reiniciar?',
              style: TextStyle(fontSize: 18, color: Colors.blue)),
          onPressed: reiniciarQuestionario,
        )
      ],
    );
  }
}
