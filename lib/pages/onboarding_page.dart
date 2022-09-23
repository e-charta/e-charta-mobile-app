import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/welcome_page.dart';
import '../bloc/app_cubit.dart';
import '../services/get_data.dart';

// () => _pageController.nextPage(
//                         duration: const Duration(milliseconds: 500),
//                         curve: Curves.easeInOut)

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _pageController = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() => isLastPage = index == 2);
            },
            controller: _pageController,
            children: const [
              WelcomePage(
                imageUrl: 'assets/images/onboarding-screen1.png',
                description:
                    'Bienvenue sur e-Charta, une application de collecte des déchets papiers au Cameroun',
              ),
              WelcomePage(
                imageUrl: 'assets/images/onboarding-screen2.png',
                description: 'Soyez récompensé en recyclant vos papiers',
              ),
              WelcomePage(
                imageUrl: 'assets/images/onboarding-screen3.png',
                description:
                    'Profitez de produits fait à base de papiers recyclés',
              ),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.4),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              axisDirection: Axis.horizontal,
              effect: SlideEffect(
                spacing: 10.0,
                radius: 4.0,
                dotWidth: 80.0,
                dotHeight: 8.0,
                strokeWidth: 1.5,
                dotColor: Colors.grey.withOpacity(0.3),
                activeDotColor: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Container(
            alignment: const Alignment(0, 0.58),
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: ElevatedButton(
                onPressed: isLastPage
                    ? () => BlocProvider.of<AppCubit>(context).getData()
                    : () => GetData().getProductData(),
                child: isLastPage
                    ? const Text(
                        'Commencer',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      )
                    : const Text(
                        'Suivant',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(45.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
