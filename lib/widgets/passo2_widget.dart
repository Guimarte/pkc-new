import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkc/pages/home/home_controller.dart';
import 'package:pkc/widgets/id_clube_widget.dart';
import 'package:pkc/widgets/step_header_widget.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:url_launcher/url_launcher.dart';

class Passo2Widget extends StatelessWidget {
  Passo2Widget({super.key});

  HomeController homeController = Get.find();

  final _controller = YoutubePlayerController.fromVideoId(
    videoId: 'oOW-dffmB1Q',
    autoPlay: false,
    params: const YoutubePlayerParams(
        showControls: true, showFullscreenButton: false),
  );

  @override
  Widget build(BuildContext context) {
    return MediaQuery.sizeOf(context).width.isLowerThan(720)
        ? Container(
            key: homeController.key2,
            color: const Color(0xff5A2683),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '2º PASSO:',
                        style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            fontSize: 18),
                      ),
                      Text(
                        ' ASSISTA AO VIDEO',
                        style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white, width: 4)),
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      // child: Image.asset('assets/images/fakevideo.png')
                      child: YoutubePlayer(
                        controller: _controller,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/android.png",
                        height: 64,
                        width: MediaQuery.sizeOf(context).width * 0.40,
                      ),
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: () {
                          launchUrl(Uri.parse(
                              "https://apps.apple.com/us/app/x-poker-poker-with-friends/id1534470447"));
                        },
                        child: Image.asset(
                          "assets/images/apple.png",
                          height: 64,
                          width: MediaQuery.sizeOf(context).width * 0.40,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        : Container(
            key: homeController.key2,
            color: const Color(0xff5A2683),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    '2º PASSO - JUNTE-SE À PKC NO X-POKER',
                    style: GoogleFonts.robotoCondensed(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                        fontSize: 36),
                  ),
                  Text(
                    "Assista ao vídeo tutorial, escolha Android ou iOS e instale o X-Poker.",
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
                        fit: BoxFit.contain,
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
