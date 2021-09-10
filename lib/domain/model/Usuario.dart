class Usuario {
  String? id;
  String? authToken;
  String? email;
  String? nome;
  String? senha;

  Usuario();

  Usuario.toemail({required this.email, required this.senha});

  Usuario.toCriar({required this.email, required this.senha, required this.nome});

  Usuario.fromJsonEmail(Map<String, dynamic> parsedJson) {
    email = parsedJson['email'] as String;
    senha = parsedJson['senha'] as String;
  }

  Usuario.fromJson(Map<String, dynamic> parsedJson) {
    authToken = parsedJson['token'] as String;
    var varUserJson = parsedJson['usuario'];
  }

  Map<String, dynamic> toJson() => {
        'token': authToken,
        'usuario': {
          'id': id,
          'email': email,
          'nome': nome,
          'senha': senha,
        },
      };

  Map<String, dynamic> toJsonemail() => {
        'email': email,
        'senha': senha,
      };

  Map<String, dynamic> toJsonNovaConta() => {
        'email': email,
        'senha': senha,
        'nome': nome,
      };
}
