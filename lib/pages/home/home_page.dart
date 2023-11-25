import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkc/pages/home/home_controller.dart';
import 'package:pkc/widgets/banner_widget.dart';
import 'package:pkc/widgets/botao_passo_widget.dart';
import 'package:pkc/widgets/entre_no_clube_widget.dart';
import 'package:pkc/widgets/footer_widget.dart';
import 'package:pkc/widgets/parabens_widget.dart';
import 'package:pkc/widgets/passo1_widget.dart';
import 'package:pkc/widgets/passo2_widget.dart';
import 'package:pkc/widgets/passo3_widget.dart';
import 'package:pkc/widgets/selecione_widget.dart';
import 'dart:html' as html;

import 'package:stroke_text/stroke_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: MediaQuery.sizeOf(context).width.isLowerThan(720)
          ? AppBar(
              toolbarHeight: MediaQuery.sizeOf(context).height * 0.14,
              backgroundColor: const Color(0xff5A2684),
              title: Wrap(alignment: WrapAlignment.center, children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image.asset("assets/images/pkc_roxo.png",
                          color: Colors.white,
                          width: MediaQuery.sizeOf(context).width * 0.2),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: StrokeText(
                              strokeWidth: 2,
                              strokeColor: Color(0xff5A2684),
                              text: " GARANTA SEU BÔNUS!",
                              textStyle: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                decorationColor: Theme.of(context).cardColor,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 5,
                        child: BotaoPassoWidget(
                            fontSize: 8,
                            height: height * 0.03,
                            function: () {
                              homeController.scrollToStep(1);
                            },
                            textoBotao: "1 - ESCOLHA SEU CLUBE"),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        flex: 5,
                        child: BotaoPassoWidget(
                            fontSize: 8,
                            height: height * 0.03,
                            function: () {
                              homeController.scrollToStep(2);
                            },
                            textoBotao: "2 - INSTALE X-POKER"),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        flex: 5,
                        child: BotaoPassoWidget(
                            fontSize: 8,
                            height: height * 0.03,
                            function: () {
                              homeController.scrollToStep(3);
                            },
                            textoBotao: "3 - CADASTRO CHIPPIX"),
                      )
                    ],
                  ),
                ),
              ]))
          : AppBar(
              toolbarHeight: 100,
              backgroundColor: const Color(0xffF5BD00),
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image.asset(
                        "assets/images/pkc_roxo.png",
                        width: MediaQuery.sizeOf(context).width * 0.08,
                        height: MediaQuery.sizeOf(context).height * 0.14,
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
                            children: [
                              Text(
                                "GARANTA SEU BÔNUS!",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(color: Color(0xffF8F8F8)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BotaoPassoWidget(
                              fontSize: 15,
                              height: height * 0.03,
                              width: width * 0.19,
                              function: () {
                                homeController.scrollToStep(1);
                              },
                              textoBotao: "1 - ESCOLHA SEU CLUBE"),
                          SizedBox(
                            width: 10,
                          ),
                          BotaoPassoWidget(
                              fontSize: 15,
                              height: height * 0.03,
                              width: width * 0.19,
                              function: () {
                                homeController.scrollToStep(2);
                              },
                              textoBotao: "2 - INSTALE X-POKER"),
                          SizedBox(
                            width: 10,
                          ),
                          BotaoPassoWidget(
                              fontSize: 15,
                              height: height * 0.03,
                              width: width * 0.19,
                              function: () {
                                homeController.scrollToStep(3);
                              },
                              textoBotao: "3 - CADASTRO CHIPPIX")
                        ],
                      ),
                    ),
                  ])),
      body: SingleChildScrollView(
        controller: homeController.scrollController.value,
        child: Column(
          children: [
            Passo1Widget(),
            Passo2Widget(),
            Passo3Widget(),
            const FooterWidget()
          ],
        ),
      ),
    );
  }
}
