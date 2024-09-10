import 'package:flutter/material.dart';
import 'package:list_view_proj/views/primary_screen.dart';

import '../components/defult_text_button.dart';


class HelloScreen extends StatefulWidget {
  final String name;
  const HelloScreen({super.key, required this.name});

  @override
  State<HelloScreen> createState() => _HelloScreen();
}

class _HelloScreen extends State<HelloScreen> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Icon(
                  Icons.account_circle,
                  color: Colors.black,
                  size: 180,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  style: const TextStyle(fontSize: 24, color: Color(0xFF125A93)),
                  'Hi ${widget.name}!',
                ),

                const SizedBox(height: 30,),
                Row(
                  children: [
                    Expanded(
                      child: buildTextButton(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                     const PrimaryScreen()), (route) => false);
                          },
                          textColor: Colors.white,
                          backgroundColor: const Color(0xFF125A93),
                          text: 'Continue'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
