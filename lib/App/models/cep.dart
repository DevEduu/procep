import 'dart:convert';

class Cep {
  String? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  String? localidade;
  String? uf;
  String? ibge;
  String? gia;
  String? ddd;
  String? siafi;

  Cep({
    this.cep,
    this.logradouro,
    this.complemento,
    this.bairro,
    this.localidade,
    this.uf,
    this.ibge,
    this.gia,
    this.ddd,
    this.siafi,
  });

  factory Cep.fromJson(Map<String, dynamic> map) {
    return Cep(
      cep: map['cep'] ?? '',
      logradouro: map['logradouro'] ?? '',
      complemento: map['complemento'] ?? '',
      bairro: map['bairro'] ?? '',
      localidade: map['localidade'] ?? '',
      uf: map['uf'] ?? '',
      ibge: map['ibge'] ?? '',
      gia: map['gia'] ?? '',
      ddd: map['ddd'] ?? '',
      siafi: map['siafi'] ?? '',
    );
  }

  factory Cep.fromJsonString(String source) {
    return Cep.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'ibge': ibge,
      'gia': gia,
      'ddd': ddd,
      'siafi': siafi,
    };
  }

  String toJson() => jsonEncode(toMap());
  
  @override
  String toString() {
    return "ViaCepModel(cep: $cep, logradouro: $logradouro, bairro: $bairro, localidade: $localidade, uf: $uf)";
  }

}
