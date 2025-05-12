import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pretium/routes/routes.dart';
import 'package:pretium/utils/appstyles.dart';

import '../widgets/common_button.dart';
import '../widgets/common_text_field.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  bool acceptTerms = true;
  bool obscurePassword = true;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton(), elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              "Create Account",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Simplify your crypto payments with us",
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 30),

            CommonTextField(
              label: 'First Name',
              hintText: "First Name",
              textInputType: TextInputType.name,
              controller: firstNameController,
              prefixIcon: Icons.person,
            ),
            const SizedBox(height: 20),

            CommonTextField(
              label: 'Last Name',
              hintText: "Last Name",
              textInputType: TextInputType.name,
              controller: lastNameController,
              prefixIcon: Icons.person,
            ),
            const SizedBox(height: 20),

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
              hintText: "Password",
              textInputType: TextInputType.visiblePassword,
              obscureText: obscurePassword,
              controller: passwordController,
              prefixIcon: Icons.lock,
              suffixIcon:
                  obscurePassword ? Icons.visibility : Icons.visibility_off,
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Checkbox(
                  value: acceptTerms,
                  onChanged:
                      (val) => setState(() => acceptTerms = val ?? false),
                ),
                Text(
                  "Accept Terms and Conditions",
                  style: TextStyle(color: AppStyles.mainColor),
                ),
              ],
            ),
            const SizedBox(height: 10),

            CommonButton(
              title: "Create Account",
              isLoading: isLoading,
              onTap: () {
                context.goNamed(AppRoutes.landing.name);
              },
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? "),
                GestureDetector(
                  onTap: () {
                    context.goNamed(AppRoutes.login.name);
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: AppStyles.mainColor,
                      fontWeight: FontWeight.w600,
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
