import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkc/pages/home/home_controller.dart';

class DropDownRegioes extends StatefulWidget {
  DropDownRegioes({super.key});

  @override
  State<DropDownRegioes> createState() => _DropDownRegioesState();
}

class _DropDownRegioesState extends State<DropDownRegioes> {
  final HomeController homeController = Get.find();

  Map<String, List<String>> regioesEstados = {
    "Norte": [
      "Acre",
      "Amapá",
      "Amazonas",
      "Pará",
      "Rondônia",
      "Roraima",
      "Tocantins"
    ],
    "Nordeste": [
      "Alagoas",
      "Bahia",
      "Ceará",
      "Maranhão",
      "Paraíba",
      "Pernambuco",
      "Piauí",
      "Rio Grande do Norte",
      "Sergipe"
    ],
    "Centro-Oeste": [
      "Goiás",
      "Mato Grosso",
      "Mato Grosso do Sul",
      "Distrito Federal"
    ],
    "Sudeste": [
      "Espírito Santo",
      "Minas Gerais",
      "Rio de Janeiro",
      "São Paulo"
    ],
    "Sul": [
      "Paraná",
      "Rio Grande do Sul",
      "Santa Catarina",
    ],
    "": [""]
  };

  List<String> regioes = [
    "",
    "Sul",
    "Norte",
    "Sudeste",
    "Centro-Oeste",
    "Nordeste",
  ];

  List<String> estados = [""];

  width() {
    if (MediaQuery.sizeOf(context).width.isLowerThan(720)) {
      return MediaQuery.sizeOf(context).width * 0.35;
    }
    if (MediaQuery.sizeOf(context).width.isLowerThan(1000) &&
        MediaQuery.sizeOf(context).width.isGreaterThan(720)) {
      return MediaQuery.sizeOf(context).width * 0.3;
    }
    if (MediaQuery.sizeOf(context).width.isLowerThan(1300) &&
        MediaQuery.sizeOf(context).width.isGreaterThan(720)) {
      return MediaQuery.sizeOf(context).width * 0.2;
    }

    return MediaQuery.sizeOf(context).width * 0.15;
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius:
              BorderRadius.circular(20.0), // Adicione uma borda arredondada
        ),
        child: DropdownMenu(
          inputDecorationTheme: InputDecorationTheme(
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.white)),
          enableSearch: false,
          width: width(),
          menuStyle: const MenuStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.white),
              surfaceTintColor: MaterialStatePropertyAll(Colors.white)),
          dropdownMenuEntries: regioes.map((String value) {
            return DropdownMenuEntry(
              value: value,
              label: value,
            );
          }).toList(),
          onSelected: (String? newValue) {
            setState(() {
              estados = regioesEstados[newValue]!;
            });
            homeController.selectedRegiao.value = newValue!;
            homeController.getClubsStateRegion(
                homeController.selectedRegiao.value, estados[0]);
          },
          initialSelection: regioes.first,
          hintText: 'Região',
          textStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      const SizedBox(
        width: 32,
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.red,

          borderRadius:
              BorderRadius.circular(20.0), // Adicione uma borda arredondada
        ),
        child: DropdownMenu(
          inputDecorationTheme: InputDecorationTheme(
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.white)),
          enableSearch: false,
          width: width(),
          dropdownMenuEntries: estados.map((String value) {
            return DropdownMenuEntry(
              value: value,
              label: value,
            );
          }).toList(),
          onSelected: (String? newValue) async {
            homeController.selectedEstado.value = newValue!;
            homeController.getClubsStateRegion(
                homeController.selectedRegiao.value,
                homeController.selectedEstado.value);
          },
          initialSelection: estados.first,
          hintText: 'Estado',
          textStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
      )
    ]);
  }
}
