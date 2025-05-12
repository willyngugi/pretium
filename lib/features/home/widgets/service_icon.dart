import 'package:flutter/material.dart';
import 'package:pretium/utils/appstyles.dart';

class ServiceIcon extends StatelessWidget {
  const ServiceIcon({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFFE4F1EF),
          child: Icon(icon, color: AppStyles.mainColor),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
