import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:procep/custom_style_app.dart';
import 'package:procep/repository/cep_repository.dart';
import 'package:procep/resultCepPage/resulty_seach_page.dart';

class HomeSeachPage extends StatelessWidget {
  const HomeSeachPage({super.key});

  @override
  Widget build(BuildContext context) {
    CustomStyleApp appStyle = CustomStyleApp();
    TextEditingController cepControle = TextEditingController();
    return Material(
      child: Scaffold(
        backgroundColor: appStyle.secundaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SvgPicture.asset('assets/logo_preto.svg'),
            ),
            Expanded(
                child: Column(
              children: [
                Text(
                  'BUSCA CEP',
                  style: TextStyle(
                      fontSize: 20,
                      color: appStyle.textColor,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: cepControle,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Digite o CEP...',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(Icons.search),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      SizedBox(
                        width: 400,
                        height: 70,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                              (states) => appStyle.primaryColor,
                            ),
                          ),
                          onPressed: () async {
                            try {
                              final cepRepository = CepRepository();
                              final cep = await cepRepository
                                  .searchAll(cepControle.text);
                              if (kDebugMode) {
                                print(cep);
                              }
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ResultySeachPage(
                                    valueCepUser: cepControle.text,
                                    localidade: cep.localidade,
                                    bairro: cep.bairro,
                                    uf: cep.uf,
                                    stateCep: cep.localidade,
                                    countryCep: 'Brasil',
                                    logradouro: cep.logradouro ?? '',
                                  ),
                                ),
                              );
                            } catch (e) {
                              // Trate o erro aqui, por exemplo, mostrando um AlertDialog
                              if (kDebugMode) {
                                print('Erro: $e');
                              }
                            }
                          },
                          child: const Text(
                            'Buscar',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  'Não Utilize n° de casa/apt/lote/prédio ou abreviação.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'By Eduardo',
                  style: TextStyle(
                    color: appStyle.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Text(
                  'Feito com ❤️',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
