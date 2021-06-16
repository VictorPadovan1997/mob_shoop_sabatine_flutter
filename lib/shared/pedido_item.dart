import 'package:flutter/material.dart';
import 'package:mob_shop/modelos/pedido.dart';
import 'package:mob_shop/repositore/local_data/dao/produto_dao.dart';

// ignore: must_be_immutable
class PedidoItem extends StatefulWidget {
  final Pedido movel;
  final Function onClick;

  PedidoItem(
    this.movel, {
    @required this.onClick,
  });

  @override
  _PedidoItemState createState() => _PedidoItemState();
}

class _PedidoItemState extends State<PedidoItem> {
  String isFavorited;
  ProdutoDao produtoDao = ProdutoDao();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => widget.onClick(),
        title: Text(
          'Produto: ' +
              widget.movel.movel.titulo +
              '\nSituação: ' +
              widget.movel.status +
              '\n' +
              'Total: ' +
              widget.movel.valor.toString(),
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
