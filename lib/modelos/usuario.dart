class Usuario {
  String id;
  String email;
  String senha;
  String nome;
  String cep;
  String logradouro;
  String bairro;

  Usuario(
    this.id,
    this.email,
    this.senha,
    this.nome,
    this.cep,
    this.logradouro,
    this.bairro,
  );

  Usuario.fromJson(Map<String, dynamic> json)
      : id = json['message']['Assinante']['id'],
        email = json['message']['Assinante']['email'],
        senha = json['message']['Assinante']['senha'],
        nome = json['message']['Assinante']['nome'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'senha': senha,
      };
}
