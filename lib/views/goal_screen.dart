import 'package:flutter/material.dart';

class GoalScreen extends StatelessWidget {
  const GoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
      const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text(
              'This is Screen 2',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Icon(Icons.home, size: 100),
          ],
        ),
      );
  }
}