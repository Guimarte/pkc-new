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

  List<String> estados = [
    "Estado",
    "Acre",
    "Amapá",
    "Amazonas",
    "Pará",
    "Rondônia",
    "Roraima",
    "Tocantins",
    "Alagoas",
    "Bahia",
    "Ceará",
    "Maranhão",
    "Paraíba",
    "Pernambuco",
    "Piauí",
    "Rio Grande do Norte",
    "Sergipe",
    "Goiás",
    "Mato Grosso",
    "Mato Grosso do Sul",
    "Distrito Federal",
    "Espírito Santo",
    "Minas Gerais",
    "Rio de Janeiro",
    "São Paulo",
    "Paraná",
    "Rio Grande do Sul",
    "Santa Catarina"
  ];

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
          dropdownMenuEntries: estados.map((String value) {
            return DropdownMenuEntry(
              value: value,
              label: value,
            );
          }).toList(),
          onSelected: (String? newValue) async {
            homeController.selectedEstado.value = newValue!;
            homeController
                .getClubsStateRegion(homeController.selectedEstado.value);
          },
          initialSelection: estados.first,
          hintText: 'Estado',
          textStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
      )
    ]);
  }
}
