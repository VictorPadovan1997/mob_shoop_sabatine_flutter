import 'package:mob_shop/modelos/movel.dart';
import 'package:mob_shop/repositore/local_data/busca_favoritos.dart';
import 'package:sqflite/sqflite.dart';
import '../app_database.dart';

class ProdutoDao {
  static final String tableSql = 'CREATE TABLE produtos('
      'id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
      'titulo TEXT,'
      'categoria TEXT,'
      'foto TEXT,'
      'descricao TEXT,'
      'preco TEXT,'
      'favorito TEXT)';

  static const String _tableName = 'produtos';
  static const String _id = 'id';
  static const String _titulo = 'titulo';
  static const String _categoria = 'categoria';
  static const String _foto = 'foto';
  static const String _descricao = 'descricao';
  static const String _preco = 'preco';
  static const String _favorito = 'favorito';

  Future<List<Movel>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> produtosDBs =
        await db.rawQuery('SELECT * FROM $_tableName');
    List<Movel> produtos = toListFind(produtosDBs);

    return produtos;
  }

  Future update(Movel movel) async {
    final Database db = await getDatabase();
    Map<String, dynamic> movelMap = _toMap(movel);

    return db
        .update(_tableName, movelMap, where: 'id = ?', whereArgs: [movel.id]);
  }

  Future<List<Movel>> buscaProduto(String categoria) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> aitDBs = await db.rawQuery(
      'SELECT * FROM produtos WHERE categoria = ?',
      [categoria],
    );
    List<Movel> produto = toListFind(aitDBs);

    return produto;
  }

  Future<List<Movel>> buscaFavoritos() async {
    final Database db = await getDatabase();
    var resultadodb = List();
    try {
      resultadodb = await db
          .rawQuery('SELECT * FROM produtos WHERE favorito !=?', ['null']);
    } catch (e) {}

    List<Movel> produtos = toListFind(resultadodb);

    return produtos;
  }

  List<Movel> toListFind(List<dynamic> produtoDBs) {
    final List<Movel> produtos = [];
    for (Map<String, dynamic> produtoDB in produtoDBs) {
      final Movel produto = Movel(
        produtoDB[_id].toString(),
        produtoDB[_titulo],
        produtoDB[_foto],
        produtoDB[_categoria],
        produtoDB[_descricao],
        int.parse((produtoDB[_preco].toString())),
        produtoDB[_favorito],
      );
      produtos.add(produto);
    }

    return produtos;
  }

  Map<String, dynamic> _toMap(Movel produto) {
    final Map<String, dynamic> produtoMap = Map();
    produtoMap[_titulo] = produto.titulo;
    produtoMap[_foto] = produto.foto;
    produtoMap[_categoria] = produto.categoria;
    produtoMap[_descricao] = produto.descricao;
    produtoMap[_preco] = produto.preco;
    produtoMap[_favorito] = produto.favorito;

    return produtoMap;
  }
}
