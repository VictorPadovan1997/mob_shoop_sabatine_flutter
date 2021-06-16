import 'package:flutter/material.dart';
import 'package:mob_shop/repositore/local_data/dao/produto_dao.dart';
import 'package:mob_shop/repositore/local_data/dao/usuario_dao.dart';

class AppDependecies extends InheritedWidget {
  final UsuarioDao usuarioDao;
  final ProdutoDao produtoDao;

  AppDependecies({
    this.usuarioDao,
    this.produtoDao,
    Widget child,
  }) : super(child: child);

  static AppDependecies of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppDependecies>();
  }

  @override
  bool updateShouldNotify(AppDependecies oldWidget) {
    return usuarioDao != oldWidget.usuarioDao;
  }
}
