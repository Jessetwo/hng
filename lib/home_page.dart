import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hng/button.dart'; // Ensure this file exists

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Function to open links using platform-specific methods
  void openLink(String url) {
    if (Platform.isAndroid) {
      Process.start(
          'am', ['start', '-a', 'android.intent.action.VIEW', '-d', url]);
    } else if (Platform.isIOS) {
      Process.start('open', [url]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HNG Links')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
              title: 'GitHub Repository',
              url: 'https://github.com/your-repo',
              onTap: () => openLink('https://github.com/your-repo'),
            ),
            const SizedBox(height: 20),
            MyButton(
              title: 'HNG Hire - Flutter Developers',
              url: 'https://hng.tech/hire/flutter',
              onTap: () => openLink('https://hng.tech/hire/flutter'),
            ),
            const SizedBox(height: 20),
            MyButton(
              title: 'Telex',
              url: 'https://telex.hng.tech',
              onTap: () => openLink('https://telex.hng.tech'),
            ),
            const SizedBox(height: 20),
            MyButton(
              title: 'Delve',
              url: 'https://delve.hng.tech',
              onTap: () => openLink('https://delve.hng.tech'),
            ),
          ],
        ),
      ),
    );
  }
}
