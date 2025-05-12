import 'package:flutter/material.dart';

import '../../../utils/appstyles.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.isLoading,
  });

  final VoidCallback onTap;
  final String title;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppStyles.mainColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: const Size(double.infinity, 55),
      ),
      child:
          isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
    );
  }
}
