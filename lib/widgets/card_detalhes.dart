import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mob_shop/modelos/item_carrinho.dart';
import 'package:mob_shop/modelos/movel.dart';
import 'package:mob_shop/shared/constantes.dart';
import 'package:mob_shop/widgets/texto_card_detalhes.dart';

class CardDetalhes extends StatelessWidget {
  final formatacaoReais = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  final Movel movel;
  final Function atualizaPagina;

  CardDetalhes({this.movel, this.atualizaPagina});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextoCardDetalhes(
              texto: movel.titulo,
              estilo: Theme.of(context).textTheme.headline1),
          TextoCardDetalhes(texto: movel.descricao),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  formatacaoReais.format(movel.preco),
                  style: TextStyle(fontSize: 25),
                ),
                FlatButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    _verificarListaItemCarrinho(
                      context,
                      itensCarrinho,
                      ItemCarrinho(movel: movel, quantidade: 1),
                    );
                  },
                  child: Text('Comprar', style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _adicionarItemCarrinho(context, ItemCarrinho item) {
    itensCarrinho.add(item);
    snackBar(context, 'Adicionado com sucesso ao Carrinho.');
    atualizaPagina();
  }

  void _verificarListaItemCarrinho(
      context, List<ItemCarrinho> lista, ItemCarrinho item) {
    int indiceMovel = lista.indexWhere((item) => item.movel == movel);

    if (indiceMovel >= 0) {
      lista[indiceMovel].quantidade = lista[indiceMovel].quantidade + 1;
    } else {
      _adicionarItemCarrinho(context, item);
    }
  }
}
