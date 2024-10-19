import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:neu_byte_digital/constant/constant.dart';
import 'package:neu_byte_digital/screens/location/access_location_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      dotsDecorator: const DotsDecorator(
        activeColor: AppColor.whiteColor,
        color: AppColor.whiteColor,
      ),
      dotsContainerDecorator: const BoxDecoration(color: Colors.transparent),
      showDoneButton: true,
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      pages: [
        PageViewModel(
            title: "",
            bodyWidget: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome aboard !",
                      style: Theme.of(context).textTheme.headlineMedium),
                  Text("Experience the power of convenience",
                      style: Theme.of(context).textTheme.headlineMedium),
                  RichText(
                    text: TextSpan(
                      text: 'with NeoByt & ',
                      style: Theme.of(context).textTheme.headlineMedium,
                      children: <TextSpan>[
                        TextSpan(
                            text: ' grow your business.',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(color: AppColor.primaryColor)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                      child: SvgPicture.asset(
                          'assets/illustration/outboard1.svg')),
                ],
              ),
            )
            //image: _buildImage('img3.jpg'),
            ),
        PageViewModel(
            title: "",
            bodyWidget: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Seamless Bill Payments at your\nfingertips, anytime, anywhere.",
                      style: Theme.of(context).textTheme.headlineMedium),
                  RichText(
                    text: TextSpan(
                      text: '#convenience redefined',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: AppColor.primaryColor),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                      child: SvgPicture.asset(
                          'assets/illustration/outboard2.svg')),
                ],
              ),
            )
            //image: _buildImage('img3.jpg'),
            ),
        PageViewModel(
            title: "",
            bodyWidget: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Embark on a journey of opportunities\nwith NeoByt,your partner for growth.",
                      style: Theme.of(context).textTheme.headlineMedium),
                  RichText(
                    text: TextSpan(
                      text: '#Empowering you',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: AppColor.primaryColor),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                      child: SvgPicture.asset(
                          'assets/illustration/outboard3.svg')),
                ],
              ),
            )
            //image: _buildImage('img3.jpg'),
            ),
      ],
      onDone: () {
        Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const AccessLocationScreen(),
            ));
      },
      onSkip: (){
        Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
              const AccessLocationScreen(),
            ));
      }, // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: Text('skip', style: Theme.of(context).textTheme.headlineMedium),
      next: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: AppColor.primaryColor,
          // borderRadius: BorderRadius.circular(50),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.arrow_forward_ios,
          color: AppColor.whiteColor,
        ),
      ),
      done: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: AppColor.primaryColor,
          // borderRadius: BorderRadius.circular(50),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.arrow_forward_ios,
          color: AppColor.whiteColor,
        ),
      ),
      controlsMargin: const EdgeInsets.all(16),
    );
  }
}
