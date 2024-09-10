import 'package:flutter/material.dart';
import 'package:list_view_proj/models/onBoarding_model.dart';
import 'package:list_view_proj/components/defult_text_button.dart';
import 'package:list_view_proj/views/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

List<OnboardingModel> onBoardingModelList = [
  OnboardingModel(
      image: 'assets/images/onBoarding/onBoarding_1.png',
      title: 'Empower your financial future',
      body: 'Securing and managing your money'),
  OnboardingModel(
      image: 'assets/images/onBoarding/onBoarding_2.png',
      title: 'Save today, thrive tomorrow',
      body: 'Your path to financial freedom starts with every penny saved'),
  OnboardingModel(
      image: 'assets/images/onBoarding/onBoarding_3.png',
      title: 'Goals realized, dreams unlocked',
      body: 'Your journey to success begins now')
];

int index = 0;

class onBoarding_screen extends StatefulWidget {
  const onBoarding_screen({super.key});

  @override
  State<onBoarding_screen> createState() => _onBoarding_screen();
}

class _onBoarding_screen extends State<onBoarding_screen> {
  final controller = PageController(initialPage: 0);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: RichText(
          text: TextSpan(
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
              children: [
                TextSpan(text: '${index + 1}'),
                const TextSpan(
                    text: '/3',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFA0A0A1)))
              ]),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(onBoardingModelList[index].image),
            const SizedBox(
              height: 32,
            ),
            Text(
              onBoardingModelList[index].title,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            Text(
              onBoardingModelList[index].body,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF868686)),
            ),
            const SizedBox(
              height: 32,
            ),
            AnimatedSmoothIndicator(
              activeIndex: index,
              count: onBoardingModelList.length,
              effect: const ExpandingDotsEffect(
                dotHeight: 9,
                dotWidth: 9,
                activeDotColor: Color(0xFF868686),
                dotColor: Color(0xFFADADAD),
              ),
            ),
            const SizedBox(height: 32,),
            buildTextButton(
                text: 'Next',
                onTap: () {
                  setState(() {});
                  if (index < 2) {
                    index++;
                  } else {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                        (route) => false);
                  }
                },
                backgroundColor: const Color(0xFF125A93),
                textColor: Colors.white),
            buildTextButton(
              text: 'Skip',
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false);
              },
              textColor: const Color(0xFF125A93),
            )
          ],
        ),
      ),
    );
  }
}
