import 'package:flutter/material.dart';

class ImagemElementoGridProdutos extends StatelessWidget {
  final String imagem;

  ImagemElementoGridProdutos({this.imagem});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image(
        fit: BoxFit.cover,
        image: AssetImage('utilidades/assets/imagens/$imagem'),
      ),
    );
  }
}
