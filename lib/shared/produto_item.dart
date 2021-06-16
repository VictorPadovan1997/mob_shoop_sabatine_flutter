import 'package:flutter/material.dart';
import 'package:mob_shop/modelos/movel.dart';
import 'package:mob_shop/repositore/local_data/dao/produto_dao.dart';

// ignore: must_be_immutable
class ProdutoItem extends StatefulWidget {
  final Movel movel;
  final Function onClick;

  ProdutoItem(
    this.movel, {
    @required this.onClick,
  });

  @override
  _ProdutoItemState createState() => _ProdutoItemState();
}

class _ProdutoItemState extends State<ProdutoItem> {
  String isFavorited;
  ProdutoDao produtoDao = ProdutoDao();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => widget.onClick(),
        title: Text(
          widget.movel.titulo +
              ' - ' +
              ' ' +
              'Valor: ' +
              widget.movel.preco.toString(),
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        trailing: IconButton(
          icon: widget.movel.favorito != null
              ? Icon(Icons.star)
              : Icon(Icons.star_border),
          color: Colors.yellow[800],
          onPressed: alteraEstadoFavoritos,
        ),
      ),
    );
  }

  void alteraEstadoFavoritos() {
    setState(() {
      if (widget.movel.favorito == null) {
        widget.movel.favorito = 'true';
        produtoDao.update(widget.movel);
      } else {
        widget.movel.favorito = null;
        produtoDao.update(widget.movel);
      }
    });
  }
}
