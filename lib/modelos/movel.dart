class Movel {
  String id;
  String titulo;
  String foto;
  String categoria;
  String descricao;
  int preco;
  String favorito;

  Movel(
    this.id,
    this.titulo,
    this.foto,
    this.categoria,
    this.descricao,
    this.preco,
    this.favorito,
  );

  Movel.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    foto = json['foto'];
    descricao = json['descricao'];
    preco = json['preco'];
  }
}
