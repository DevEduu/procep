
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:procep/controller/cep_controller.dart';
import 'package:procep/custom_style_app.dart';

class HomeSeachPage extends StatelessWidget {
  const HomeSeachPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<CepController>(CepController());
    CustomStyleApp appStyle = CustomStyleApp();

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
                      Obx(() => TextFormField(
                            controller: TextEditingController(
                              text: controller.cepValue.value,
                            ),
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
                          )),
                      const SizedBox(height: 16.0),
                      SizedBox(
                        width: 400,
                        height: 70,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateColor.resolveWith(
                              (states) => appStyle.primaryColor,
                            ),
                          ),

                          onPressed: () {
                            try {
                              if (controller.cepValue.value.length >= 8) {
                                Get.toNamed('/result', arguments: controller.cepValue.value);
                              }
                            } catch (e) {
                              Get.snackbar('Erro', 'Cep inválido');
                            }
                          }
                          ,
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
