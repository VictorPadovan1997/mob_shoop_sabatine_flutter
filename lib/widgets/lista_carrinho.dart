import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mob_shop/modelos/item_carrinho.dart';
import 'package:mob_shop/modelos/movel.dart';
import 'package:mob_shop/shared/constantes.dart';

class ListaCarrinho extends StatefulWidget {
  final Function atualiza;

  ListaCarrinho({this.atualiza});

  @override
  _ListaCarrinhoState createState() => _ListaCarrinhoState();
}

class _ListaCarrinhoState extends State<ListaCarrinho> {
  final List<ItemCarrinho> carrinho = itensCarrinho;
  final formatacaoReais = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: carrinho.length,
      itemBuilder: (BuildContext context, int indice) {
        ItemCarrinho item = carrinho[indice];
        Movel movel = item.movel;
        return carrinho.length == 0
            ? Container(
                alignment: Alignment.center,
                height: double.infinity,
                child: Text('Nenhum item no carrinho'),
              )
            : Container(
                margin: EdgeInsets.all(16),
                child: Card(
                  child: Row(
                    children: [
                      Expanded(
                        child: Image(
                          image: AssetImage(
                              'utilidades/assets/imagens/${movel.foto}'),
                          height: 92,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 92,
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(movel.titulo,
                                  style: TextStyle(fontSize: 15)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(formatacaoReais.format(movel.preco)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () => _aumentarQuantidade(item),
                                    child: Container(
                                      margin: EdgeInsets.all(8),
                                      child: Icon(Icons.add, size: 25),
                                    ),
                                  ),
                                  Text('${item.quantidade}'),
                                  GestureDetector(
                                    onTap: () => _diminuirQuantidade(item),
                                    child: Container(
                                      margin: EdgeInsets.all(8),
                                      child: Icon(Icons.remove, size: 25),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
      },
    );
  }

  void _aumentarQuantidade(ItemCarrinho item) {
    setState(() {
      item.quantidade++;
      widget.atualiza();
    });
  }

  void _diminuirQuantidade(ItemCarrinho item) {
    if (item.quantidade > 1) {
      setState(() {
        item.quantidade--;
        widget.atualiza();
      });
    } else {
      _removerMovel(item);
    }
  }

  void _removerMovel(ItemCarrinho item) {
    setState(() {
      itensCarrinho.remove(item);
      widget.atualiza();
    });
  }
}
