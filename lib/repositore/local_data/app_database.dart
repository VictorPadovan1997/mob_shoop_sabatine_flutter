import 'package:flutter/services.dart';
import 'package:mob_shop/repositore/local_data/dao/produto_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dao/usuario_dao.dart';

Future<Database> getDatabase() async {
  final produtoSql = await rootBundle.loadString('data/produtos.sql');
  final String path = join(await getDatabasesPath(), 'banco_mobshop.db');
  return openDatabase(
    path,
    onCreate: (db, version) async {
      await db.execute(ProdutoDao.tableSql);
      await db.execute(UsuarioDao.tableSql);
      await db.execute(produtoSql);
    },
    version: 1,
  );
}
