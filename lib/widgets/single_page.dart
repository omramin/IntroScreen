import 'package:flutter/material.dart';

class SinglePage extends StatelessWidget {
  const SinglePage({
    super.key,
    required this.imgPath,
    required this.title,
    required this.subTitle,
    required this.onSkip,
  });

  final String imgPath, title, subTitle;
  final void Function() onSkip;

  final Color containerColor = const Color(0xfff4b5a4);
  final Color titleColor = const Color(0xfff4b5a4);

  @override
  Widget build(BuildContext context) {
    const Color background =  Color.fromARGB(255, 245, 229, 229);
    const Color fill = Color(0xfff4b5a4);
    const List<Color> gradient = [
      background,
      background,
      fill,
      fill,
    ];
    const double fillPercent = 56.23; // fills 56.23% for container from bottom
    const double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];

    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  // color: Color.fromARGB(0, 247, 236, 225),
                  gradient: LinearGradient(
                    colors: gradient,
                    stops: stops,
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(0),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(0),
                    topRight: Radius.circular(0),
                  )),
              child: Image.asset(imgPath),
            ),
            Positioned(
              top: 50,
              right: 1,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                onPressed: onSkip,
                child: const Row(
                  children: [
                    Text('Skip'),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: titleColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
          child: ColoredBox(color: Colors.black),
        ),
      ],
    );
  }
}
