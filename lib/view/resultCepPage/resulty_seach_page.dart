import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:procep/custom_style_app.dart';

class ResultySeachPage extends StatelessWidget {
  ResultySeachPage({
    Key? key,
  }) : super(key: key);
  final _cepValueInput = Get.arguments();



  @override
  Widget build(BuildContext context) {
    CustomStyleApp appStyle = CustomStyleApp();

    return Scaffold(
      backgroundColor: appStyle.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SvgPicture.asset('assets/logo_branco.svg'),
          ),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  const Text(
                    'RESULTADO DA BUSCA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        InfoTableCep(
                          uf: 'uf',
                          valueCepUser:_cepValueInput,
                          logradouro:' logradouro',
                          localidade: 'localidade',
                          bairro:' bairro 0',
                          stateCep: 'stateCep',
                          countryCep: 'countryCep',
                        ),
                        const SizedBox(height: 16.0),
                        SizedBox(
                          width: 400,
                          height: 70,
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.search, color: Colors.white),
                            style: ButtonStyle(
                              backgroundColor: WidgetStateColor.resolveWith(
                                (states) => appStyle.buttonBackgroundColor,
                              ),
                            ),
                            onPressed: () {
                              Get.toNamed('/');
                            },
                            label: const Text(
                              'BUSCAR CEP NOVAMENTE',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Text(
                    'Errata altenativa.\nNão temos vínculo com os Correios.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(
                        255,
                        218,
                        218,
                        218,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'By Eduardo',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Text(
                'Feito com ❤️',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class InfoTableCep extends StatelessWidget {
  const InfoTableCep(
      {super.key,
      required this.valueCepUser,
      required this.logradouro,
      required this.localidade,
      required this.uf,
      required this.bairro,
      required this.stateCep,
      required this.countryCep});

  final String valueCepUser; //Código do CEP
  final String logradouro; //Endereço
  final String localidade; //Cidade
  final String uf; //Sigla Estado
  final String bairro; //Bairro
  final String stateCep; //Estado
  final String countryCep; //País

  @override
  Widget build(BuildContext context) {
    TextStyle tituloStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    double sizeDividerText = 10;
    double bordeRadioValue = 20;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(bordeRadioValue),
      ),
      child: Column(
        children: [
          // Recorte sobre o objeto pai
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(bordeRadioValue),
              topRight: Radius.circular(bordeRadioValue),
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              color: Colors.amber,
              child: Center(
                child: Text(
                  'Dados sobre o CEP: $valueCepUser',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Logradouro',
                    style: tituloStyle,
                  ),
                  Text(logradouro),
                  Gap(sizeDividerText),
                  Text(
                    'Cidade',
                    style: tituloStyle,
                  ),
                  Text(localidade),
                  Gap(sizeDividerText),
                  Text(
                    'UF',
                    style: tituloStyle,
                  ),
                  Text(uf),
                  Gap(sizeDividerText),
                ],
              ),
              Container(
                height: 150,
                width: 3,
                color: const Color.fromARGB(20, 0, 0, 0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bairro',
                    style: tituloStyle,
                  ),
                  Text(bairro),
                  Gap(sizeDividerText),
                  Text(
                    'Estado',
                    style: tituloStyle,
                  ),
                  Text(stateCep),
                  Gap(sizeDividerText),
                  Text(
                    'País',
                    style: tituloStyle,
                  ),
                  Text(countryCep),
                  const Gap(20),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
