import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:test/part11/main.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Wake extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 223, 176),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          AnimatedTextKit(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            },
            animatedTexts: [
              WavyAnimatedText('Have a nice day!',
                  textStyle: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic),
                  speed: const Duration(milliseconds: 800)),
            ],
            totalRepeatCount: 1,
            pause: Duration(milliseconds: 600),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
          Padding(padding: EdgeInsets.all(150)),
          Image.asset('assets/images/image.jpg', width: 100)
              .animate(onPlay: (controller) => controller.repeat())
              .shake(hz: 1000, duration: 7000.ms)
              .slideX(begin: -3, end: 3, duration: 7000.ms)
        ]),
      ),
    );
  }
}
