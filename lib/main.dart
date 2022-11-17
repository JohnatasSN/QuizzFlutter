import 'package:flutter/material.dart';
import 'package:flutter_quizz/questinario.dart';
import 'package:flutter_quizz/result.dart';

main() => runApp(const Flutterquizz());

class _FlutterquizzState extends State<Flutterquizz> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 1},
        {'texto': 'Cobra', 'pontuacao': 3},
        {'texto': 'Elefante', 'pontuacao': 5},
        {'texto': 'Leão', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Mario', 'pontuacao': 1},
        {'texto': 'João', 'pontuacao': 2},
        {'texto': 'Leo', 'pontuacao': 3},
        {'texto': 'Pedro', 'pontuacao': 4},
      ],
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    //for (String textoResp
    //    in perguntas[_perguntaSelecionada].cast()['respostas']) {
    //  respostas.add(Resposta(textoResp, _responder));
    //}

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questinario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : Resultado(
                pontuacao: _pontuacaoTotal,
                quandoReiniciarQuestionario: _reiniciarQuestionario),
      ),
    );
  }
}

class Flutterquizz extends StatefulWidget {
  const Flutterquizz({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FlutterquizzState createState() {
    return _FlutterquizzState();
  }
}
