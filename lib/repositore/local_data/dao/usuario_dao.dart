import 'package:sqflite/sqflite.dart';
import '../../../modelos/usuario.dart';
import '../app_database.dart';

class UsuarioDao {
  static final String tableSql = 'CREATE TABLE usuarios('
      'id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
      'email TEXT,'
      'senha TEXT,'
      'nome TEXT,'
      'cep TEXT,'
      'logradouro TEXT,'
      'bairro TEXT)';

  static const String _tableName = 'usuarios';
  static const String _id = 'id';
  static const String _email = 'email';
  static const String _senha = 'senha';
  static const String _nome = 'nome';
  static const String _cep = 'cep';
  static const String _logradouro = 'logradouro';
  static const String _bairro = 'bairro';

  @override
  Future<List<Usuario>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> usuarioDBs =
        await db.rawQuery('SELECT * FROM $_tableName');
    List<Usuario> usuario = toListFind(usuarioDBs);

    return usuario;
  }

  @override
  List<Usuario> toListFind(List<dynamic> usuarioDBs) {
    final List<Usuario> usuarios = [];
    for (Map<String, dynamic> usuarioDB in usuarioDBs) {
      final Usuario usuario = Usuario(
        usuarioDB[_id].toString(),
        usuarioDB[_email],
        usuarioDB[_senha],
        usuarioDB[_nome],
        usuarioDB[_cep],
        usuarioDB[_logradouro],
        usuarioDB[_bairro],
      );
      usuarios.add(usuario);
    }

    return usuarios;
  }

  Future save(Usuario usuario) async {
    final Database db = await getDatabase();
    Map<String, dynamic> usuarioMap = _toMap(usuario);
    List<Usuario> usuarios = await verificaSeUsuarioExiste(usuario.email);

    if (usuarios.length > 0) {
      return db.update(_tableName, usuarioMap,
          where: 'id = ?', whereArgs: [usuario.id]);
    } else {
      return db.insert(_tableName, usuarioMap);
    }
  }

  Future deletaUsuario(Usuario usuario) async {
    final Database db = await getDatabase();

    return db.delete(_tableName, where: 'id = ?', whereArgs: [usuario.id]);
  }

  Future<List<Usuario>> verificaSeUsuarioExiste(email) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> aitDBs = await db.rawQuery(
      'SELECT * FROM usuarios WHERE email = ?',
      [email],
    );
    List<Usuario> usuario = toListFind(aitDBs);

    return usuario;
  }

  Map<String, dynamic> _toMap(Usuario usuario) {
    final Map<String, dynamic> usuarioMap = Map();
    usuarioMap[_id] = usuario.id;
    usuarioMap[_email] = usuario.email;
    usuarioMap[_senha] = usuario.senha;
    usuarioMap[_nome] = usuario.nome;
    usuarioMap[_cep] = usuario.cep;
    usuarioMap[_logradouro] = usuario.logradouro;
    usuarioMap[_bairro] = usuario.bairro;

    return usuarioMap;
  }
}
