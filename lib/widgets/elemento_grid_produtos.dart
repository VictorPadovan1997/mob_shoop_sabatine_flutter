import 'package:flutter/material.dart';
import 'package:mob_shop/modelos/movel.dart';
import 'package:mob_shop/paginas/lista_produto.dart';
import 'package:mob_shop/repositore/local_data/busca_produtos.dart';
import 'package:mob_shop/widgets/degrade_elemento_grid_produtos.dart';
import 'package:mob_shop/widgets/imagem_elemento_grid_produtos.dart';
import 'package:mob_shop/widgets/titulo_elemento_grid_produtos.dart';

class ElementoGridProdutos extends StatefulWidget {
  final Movel movel;
  final Function atualiza;

  ElementoGridProdutos({this.movel, this.atualiza});

  @override
  _ElementoGridProdutosState createState() => _ElementoGridProdutosState();
}

class _ElementoGridProdutosState extends State<ElementoGridProdutos> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BuscaProduto(widget.movel.titulo),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 2,
              blurRadius: 8,
              color: Colors.black12,
            )
          ],
        ),
        margin: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ImagemElementoGridProdutos(imagem: widget.movel.foto),
              DegradeElementoGridProdutos(),
              TituloElementoGridProdutos(titulo: widget.movel.titulo)
            ],
          ),
        ),
      ),
    );
  }
}
