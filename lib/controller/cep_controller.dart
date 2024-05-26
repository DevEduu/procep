import 'dart:convert';
import 'package:get/get.dart';
import 'package:procep/models/cep.dart';
import 'package:http/http.dart' as http;

class CepController extends GetxController {
  var cepValue = ''.obs;
  var cepReponse = Cep().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCep(cepValue.value);
  }

  fetchCep(String cep) async {
    String cepUrl = ("https://viacep.com.br/ws/$cep/json/");
    final response = await http.get(Uri.parse(cepUrl));

    if (response.statusCode == 200) {
      final cepResult = jsonDecode(response.body)["data"];
      cepReponse.value = cepResult.json((e) => Cep.fromJson(e));
      isLoading.value = false;
      update();
    } else {
      Get.snackbar('Erro Loading data!',
          'Server responded ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }
}
