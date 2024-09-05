import 'package:decor_onboarding/widgets/single_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final controller = PageController();
  bool isLastPage = false;

  final Color btnColor = const Color(0xfff4b5a4);
  final Color dotsColor = const Color(0xfff4b5a4);
  final Color bgColor = const Color.fromARGB(255, 245, 229, 229);


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: bgColor,
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 3;
            });
          },
          children: [
            //-------P1
            // Container(
            //   color: Colors.red,
            //   child: Center(
            //     child: Text('Page1'),
            //   ),
            // ),
            SinglePage(
              imgPath: 'assets/images/f1.png',
              title: 'Comfortable Space',
              subTitle:
                  'It is important to take care of the patient, to be followed by the doctor, but it is a time of great pain and suffering',
              onSkip: () {
                controller.jumpToPage(3);
              },
            ),
      
            //-------P2
            SinglePage(
              imgPath: 'assets/images/f2.png',
              title: 'Modern Design',
              subTitle:
                  'It is important to take care of the patient, to be followed by the doctor, but it is a time of great pain and suffering',
              onSkip: () {
                controller.jumpToPage(3);
              },
            ),
            //-------P3
            SinglePage(
              imgPath: 'assets/images/f3.png',
              title: 'Styled Living',
              subTitle:
                  'It is important to take care of the patient, to be followed by the doctor, but it is a time of great pain and suffering',
              onSkip: () {
                controller.jumpToPage(3);
              },
            ),
            //-------P4
            SinglePage(
              imgPath: 'assets/images/f4.png',
              title: 'Relaxing Furniture',
              subTitle:
                  'It is important to take care of the patient, to be followed by the doctor, but it is a time of great pain and suffering',
              onSkip: () {
                controller.jumpToPage(3);
              },
            ),
          ],
        ),
      ),

      // Bottom Buttons created via btmSheet
      bottomSheet: Container(
        color: bgColor,
        padding: const EdgeInsets.only(bottom: 20, right: 25, left: 25),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // TextButton(
            //   child: const Text('Skip'),
            //   onPressed: () {
            //     controller.jumpToPage(3);
            //   },
            // ),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 4,
                onDotClicked: (index) => controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                ),
                effect: ExpandingDotsEffect(
                  activeDotColor: dotsColor,
                ),
              ),
            ),
            //------------------NEXT BUTTON
            isLastPage
                ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: btnColor,
                      ),
                      onPressed: () {
                        // Navigate to your desired page
                        /*Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context)=> const IntroScreen()),
                        );*/
                      },
                      child: const Flexible(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )                  
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: btnColor,
                    ),
                    onPressed: () => controller.nextPage(
                      duration: const Duration(microseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
