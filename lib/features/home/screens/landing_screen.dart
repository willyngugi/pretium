import 'package:flutter/material.dart';
import 'package:pretium/utils/appstyles.dart';

import '../widgets/service_icon.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyles.mainColor,
        elevation: 0,
        title: const Text(
          'Hello, Willy 👋',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.notifications_none, color: Colors.white),
          ),
        ],
        leading: Padding(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              'W',
              style: TextStyle(
                color: AppStyles.mainColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Wallet Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppStyles.mainColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Icons.account_balance_wallet,
                        color: Colors.white,
                        size: 32,
                      ),
                      Icon(Icons.visibility, color: Colors.white70),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Wallet Balance',
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'KES 0.00',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '\$ 0.00',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Financial Services',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            'Kenya',
                            style: TextStyle(color: Color(0xFF0F5F52)),
                          ),
                          Icon(Icons.arrow_drop_down, color: Color(0xFF0F5F52)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      ServiceIcon(icon: Icons.send, label: 'Send Money'),
                      ServiceIcon(
                        icon: Icons.shopping_bag_outlined,
                        label: 'Buy Goods',
                      ),
                      ServiceIcon(icon: Icons.receipt_long, label: 'Paybill'),
                      ServiceIcon(icon: Icons.smartphone, label: 'Airtime'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Recent transactions',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('See all', style: TextStyle(color: AppStyles.mainColor)),
              ],
            ),
            const SizedBox(height: 32),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.receipt_long, size: 48, color: Colors.grey),
                SizedBox(height: 12),
                Text(
                  'No recent transactions',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20.0,
        elevation: 5.0,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 15.0,
        unselectedFontSize: 15.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_wallet_outlined,
              color: AppStyles.mainColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code, color: AppStyles.mainColor, size: 40),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long, color: Colors.grey),
            label: '',
          ),
        ],
      ),
    );
  }
}
