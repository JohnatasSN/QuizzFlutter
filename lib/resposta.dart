import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String resposta;

  final void Function() selected;

  const Resposta(this.resposta, this.selected, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
        ),
        onPressed: selected,
        child: Text(resposta),
      ),
    );
  }
}
