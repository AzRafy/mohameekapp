import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mohameekapp/sign_in.dart';
import 'package:mohameekapp/switch_lang.dart';

TextStyle styleSlider = GoogleFonts.dmSans(
  textStyle: const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  ),
);
TextStyle subtitleStyle = GoogleFonts.dmSans(
  textStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  ),
);

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  @override
  List<Widget> sliderList = [
    Column(
      children: [
        Text(
          'Hire Skilled Professionals',
          style: styleSlider,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Text(
            'Find skilled professionals for any job with Mohameek.',
            style: subtitleStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
    Column(
      children: [
        Text(
          'Book Experts Easily',
          style: styleSlider,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Text(
            "Hiring a professional is hassle-free with Mohameek's easy-to-use app.",
            style: subtitleStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
    Column(
      children: [
        Text(
          'Get Jobs Done by Experts',
          style: styleSlider,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Text(
            "Access a range of skilled professionals for any job with Mohameek.",
            style: subtitleStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  ];

  final CarouselSliderController controller = CarouselSliderController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            const Positioned(
              right: 20,
              top: 30,
              child: SwitchLang(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 67),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CarouselSlider(
                        items: sliderList,
                        carouselController: controller,
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height * 0.2,
                          autoPlay: false,
                          enableInfiniteScroll: true,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentPage = index;
                              if (_currentPage == sliderList.length - 1) {
                                Timer(
                                  const Duration(seconds: 2),
                                  () {
                                    Get.to(() => const SignIn());
                                  },
                                );
                              }
                            });
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          sliderList.length,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1, color: Colors.white),
                              color: _currentPage == index
                                  ? Colors.white
                                  : Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 50,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              side: const BorderSide(
                                  color: Colors.white, width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              )),
                          onPressed: () {
                            controller.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn,
                            );
                          },
                          child: _currentPage == sliderList.length - 1
                              ? Text(
                                  'Get Started',
                                  style: Theme.of(context).textTheme.titleSmall,
                                )
                              : Text(
                                  'Next',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          TextButton(
                            onPressed: () {
                              Timer(const Duration(milliseconds: 200), () {
                                Get.to(() => const SignIn());
                              });
                            },
                            child: Text(
                              'Sign In',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
