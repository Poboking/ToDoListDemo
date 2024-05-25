import 'dart:ui';

import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Setting Page         ')),
        backgroundColor: Colors.deepPurple[300],
      ),
      backgroundColor: Colors.deepPurple[200],
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: 300,
          width: 300,
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.deepPurple[600],
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.favorite,
                color: Colors.purpleAccent[100],
                size: 60,
              ),

              Text(
                "Manufactured By @Antaneta",
                textAlign: TextAlign.center,
                style: TextStyle(
                  backgroundColor: Colors.greenAccent[100],
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Text(
                "You can contact me at yacanonli@gmail.com",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
