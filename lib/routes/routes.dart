import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/authentication/screens/login_screen.dart';
import '../features/authentication/screens/registration_screen.dart';
import '../features/home/screens/landing_screen.dart';
import '../features/intro_screens/onboarding_screen.dart';
import '../features/intro_screens/splash_screen.dart';

part 'routes.g.dart';

enum AppRoutes { splash, onboarding, landing, login, registration }

@riverpod
GoRouter goRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/splash',
        name: AppRoutes.splash.name,
        builder: (ctx, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        name: AppRoutes.onboarding.name,
        builder: (ctx, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        name: AppRoutes.login.name,
        builder: (ctx, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/registration',
        name: AppRoutes.registration.name,
        builder: (ctx, state) => const RegistrationScreen(),
      ),
      GoRoute(
        path: '/landing',
        name: AppRoutes.landing.name,
        builder: (ctx, state) => const LandingScreen(),
      ),
    ],
  );
}
