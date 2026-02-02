import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../Model/Onbording Model.dart';
import 'package:get/get.dart';

import '../Location Screen/ui.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,

            colors: [Color(0xFF0D1B3E), Color(0xFF000509)],
          ),
        ),
        child: IntroductionScreen(
          globalBackgroundColor: Colors.transparent,
          pages: getPagesViewModel(),
          showSkipButton: true,
          skip: const Text("Skip", style: TextStyle(color: Colors.white)),
          next: const Icon(Icons.arrow_forward, color: Colors.white),
          done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white)),
          onDone: () {
            Get.to(()=>LocationScreen());
          },

        ),
      ),
    );
  }
}