import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pretium/routes/routes.dart';
import 'package:pretium/utils/appstyles.dart';
import '../widgets/common_button.dart';
import '../widgets/common_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  bool rememberMe = false;
  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 40),

            // Wallet Icon
            Center(
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F2F0),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.account_balance_wallet_outlined,
                  color: Color(0xFF0F5F52),
                  size: 32,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Title
            const Text(
              "Welcome Back!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Sign in to continue",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 30),

            CommonTextField(
              label: 'Email',
              hintText: "Email",
              textInputType: TextInputType.emailAddress,
              controller: emailController,
              prefixIcon: Icons.email,
            ),
            const SizedBox(height: 20),

            CommonTextField(
              label: 'Password',
              hintText: 'Password',
              textInputType: TextInputType.visiblePassword,
              obscureText: obscurePassword,
              controller: passwordController,
              prefixIcon: Icons.lock,
              suffixIcon:
                  obscurePassword ? Icons.visibility : Icons.visibility_off,
            ),
            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged:
                          (val) => setState(() => rememberMe = val ?? false),
                      activeColor: AppStyles.mainColor,
                    ),
                    const Text(
                      "Remember me",
                      style: TextStyle(color: Colors.black87),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: AppStyles.mainColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),

            CommonButton(
              title: "Login",
              isLoading: isLoading,
              onTap: () {
                context.goNamed(AppRoutes.landing.name);
              },
            ),
            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(color: Colors.black87),
                ),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(AppRoutes.registration.name);
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: AppStyles.mainColor,
                      fontWeight: FontWeight.bold,
                    ),
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
