import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkc/pages/home/home_controller.dart';
import 'package:pkc/widgets/clubes_widget.dart';
import 'package:pkc/widgets/drop_down_widget.dart';
import 'package:pkc/widgets/step_header_widget.dart';

class Passo1Widget extends StatelessWidget {
  Passo1Widget({super.key});
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return MediaQuery.sizeOf(context).width.isLowerThan(720)
        ? Container(
            color: Color(0xffF7F1F7),
            key: homeController.key1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '1º PASSO - ONDE ESTÁ SEU CLUBE\n DO CORAÇÃO?',
                    style: GoogleFonts.robotoCondensed(
                        color: Color(0xff5A2684),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xff5A2684),
                        fontSize: 18),
                    maxLines: 2,
                  ),
                  DropDownRegioes(),
                  const SizedBox(
                    height: 48,
                  ),
                  ClubesWidget(),
                  const SizedBox(
                    height: 48,
                  ),
                ],
              ),
            ),
          )
        : Container(
            color: Color(0xffF7F1F7),
            key: homeController.key1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '1º PASSO - ESCOLHA SEU CLUBE PREFERIDO',
                    style: GoogleFonts.robotoCondensed(
                        color: Color(0xff5A2684),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xff5A2684),
                        fontSize: 36),
                    maxLines: 1,
                  ),
                  Text(
                    'Selecione a região/estado do seu clube preferido.\nEm seguida, clique no logo do seu clube.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w300,
                        fontSize: 30,
                        color: Color(0xff5A2684)),
                  ),
                  DropDownRegioes(),
                  const SizedBox(
                    height: 80,
                  ),
                  ClubesWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
  }
}
