import 'package:flutter/material.dart';
import 'package:mob_shop/modelos/item_carrinho.dart';
import 'package:mob_shop/modelos/pedido.dart';
import 'package:mob_shop/repositore/local_data/dao/usuario_dao.dart';

import '../modelos/usuario.dart';
import '../modelos/usuario.dart';

List<ItemCarrinho> itensCarrinho = List();
List<Pedido> listaDepedido = List();

UsuarioDao usuarioDao = UsuarioDao();
final novoUsuario = Usuario('1', '', '', '', '', '', '');
void snackBar(context, titulo) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(titulo),
    duration: Duration(seconds: 5),
  ));
}
