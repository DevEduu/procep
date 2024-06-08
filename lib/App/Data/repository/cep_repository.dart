import 'package:procep/App/models/cep.dart';
import 'package:http/http.dart' as http;

class CepRepository {
  Future<Cep> searchAll(String cep) async {
    final cepResponse =
        await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));

    if (cepResponse.statusCode == 200) {
      // A resposta foi bem-sucedida, decodifique o JSON
      final cepRetorn = Cep.fromJsonString(cepResponse.body);
      return cepRetorn;
    } else {
      // A resposta não foi bem-sucedida, trate o erro
      throw Exception(
          'Falha ao buscar dados do CEP: ${cepResponse.statusCode}');
    }
  }
}
