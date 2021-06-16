import 'package:flutter/material.dart';

class TituloElementoGridProdutos extends StatelessWidget {
  final String titulo;

  TituloElementoGridProdutos({this.titulo});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      child: Text(
        titulo,
        style: TextStyle(
          color: Colors.white,
          height: 8,
          fontSize: 20,
        ),
      ),
    );
  }
}
