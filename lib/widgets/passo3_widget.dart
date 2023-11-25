import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkc/pages/home/home_controller.dart';
import 'package:pkc/widgets/step_header_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'id_clube_widget.dart';

class Passo3Widget extends StatelessWidget {
  Passo3Widget({super.key});
  HomeController homeController = Get.find();

  final _controller = YoutubePlayerController.fromVideoId(
    videoId: 'dQw4w9WgXcQ',
    autoPlay: false,
    params: const YoutubePlayerParams(
      showFullscreenButton: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MediaQuery.sizeOf(context).width.isLowerThan(720)
        ? Container(
            key: homeController.key3,
            color: const Color(0xffF7F1F7),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1,
                height: MediaQuery.sizeOf(context).height * 0.25,
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(color: Color(0xff5A2683), width: 8),
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          'PASSO FINAL',
                          style: GoogleFonts.robotoCondensed(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                              fontSize: 18),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          launchUrl(Uri.parse(
                              "https://wa.me/message/7UGBBZ5RYI5KB1"));
                        },
                        child: Text(
                          "CLIQUE AQUI!\n ABRA O WHATSAPP E GRITE\n  'OI! CHICO'\n 'CADÊ MEUS R\$30,00?!",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : Container(
            key: homeController.key3,
            color: const Color(0xff5A2683),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'PASSO FINAL: RESGATE R\$30 DE BÔNUS',
                    style: GoogleFonts.robotoCondensed(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                        fontSize: 36),
                  ),
                  Text(
                    "Ganhar seu bônus de R\$30 é rápido \ne seguro com o aplicativo Chippix. \nSiga os passos do vídeo abaixo \ne comece a jogar em instantes.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w300,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: Color(0xffF5BD00), width: 4)),
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      child: Image.asset(
                        'assets/images/fakevideo.png',
                        fit: BoxFit.fill,
                      )
                      // child: YoutubePlayer(
                      //   controller: _controller,
                      //   aspectRatio: 16 / 9,
                      // ),
                      ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/images/android.png",
                          height: MediaQuery.sizeOf(context).height * 0.10,
                          fit: BoxFit.fill,
                          width: MediaQuery.sizeOf(context).width * 0.39,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/images/apple.png",
                          height: MediaQuery.sizeOf(context).height * 0.10,
                          fit: BoxFit.fill,
                          width: MediaQuery.sizeOf(context).width * 0.40,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
