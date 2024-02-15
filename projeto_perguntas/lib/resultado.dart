import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  const Resultado(this.pontuacaoTotal, this.quandoReiniciarQuestionario,
      {super.key});
  final int pontuacaoTotal;
  final void Function() quandoReiniciarQuestionario;

  String get fraseResultado {
    if (pontuacaoTotal < 8) {
      return 'Parabéns!';
    } else if (pontuacaoTotal < 12) {
      return 'Você é bom!';
    } else if (pontuacaoTotal < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(
                fontSize: 30, color: Colors.green, fontWeight: FontWeight.w900),
          ),
        ),
        TextButton(
          onPressed: quandoReiniciarQuestionario,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
          ),
          child: const Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 18),
          ),
        )
      ],
    );
  }
}
