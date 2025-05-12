import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/routes.dart';
import '../../utils/appstyles.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      "heading": "Direct Pay",
      "description": "Pay with crypto across Africa effortlessly",
      "Icon": Icons.credit_card,
    },
    {
      "heading": "Accepts Payments",
      "description": "Accept stablecoin payments hastle-free",
      "Icon": Icons.account_balance_wallet_outlined,
    },
    {
      "heading": "Pay Bills",
      "description": "Pay for utility and earn rewards",
      "Icon": Icons.receipt_long_outlined,
    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _skip() {
    _completeOnboarding();
  }

  Future<void> _completeOnboarding() async {
    context.goNamed(AppRoutes.login.name);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: AppStyles.mainColor.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _pages[index]["Icon"],
                      size: 50,
                      color: AppStyles.mainColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _pages[index]["heading"]!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      _pages[index]["description"]!,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            top: 40,
            right: 20,
            child:
                _currentPage < _pages.length - 1
                    ? GestureDetector(
                      onTap: _skip,
                      child: Text(
                        "Skip",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    )
                    : const SizedBox(),
          ),
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: _currentPage == index ? 30 : 8,
                  height: _currentPage == index ? 12 : 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color:
                        _currentPage == index
                            ? AppStyles.mainColor
                            : AppStyles.mainColor.withOpacity(0.2),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 30,
            right: 30,
            child: ElevatedButton(
              onPressed: () {
                if (_currentPage == _pages.length - 1) {
                  _completeOnboarding();
                } else {
                  _pageController.animateToPage(
                    _currentPage + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: AppStyles.mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                _currentPage == _pages.length - 1 ? "Get Started" : 'Next',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
