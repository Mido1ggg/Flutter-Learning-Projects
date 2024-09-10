import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:list_view_proj/views/budget_screen.dart';
import 'package:list_view_proj/views/goal_screen.dart';
import 'package:list_view_proj/views/wallet_screen.dart';

class PrimaryScreen extends StatefulWidget {
  const PrimaryScreen({super.key});

  @override
  State<PrimaryScreen> createState() => _PrimaryScreen();
}


class _PrimaryScreen extends State<PrimaryScreen> {
  DateTime now = DateTime.now();
  int currentIndex = 0;
  final List<Widget> screens = [

  const BudgetScreen(),
  const GoalScreen(),
  const WalletScreen(),

  ];
  final List<BottomNavigationBarItem> navigationItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.local_atm),
      label: 'Budget',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.savings_outlined),
      label: 'Goal',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.account_balance_wallet_outlined),
      label: 'Wallet',
    ),
  ];

  void onNavigationBarItemTapped(int index) {
    setState(() {
      currentIndex = index;
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>screens[index]));
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          DateFormat('EEE, MMM d').format(now),
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(currentIndex: currentIndex,
        backgroundColor: const Color(0xFF125A93),
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xFFA5C8FC),
        type: BottomNavigationBarType.fixed ,
        onTap: onNavigationBarItemTapped,
        items: navigationItems,
      ),
    );
  }
}
