import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hng/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> openLink(String url) async {
    try {
      // Using platform channel to communicate with Android native code
      const platform = MethodChannel('com.example.hng/browser');
      await platform.invokeMethod('openBrowser', {'url': url});
    } on PlatformException catch (e) {
      debugPrint('Failed to open link: ${e.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HNG Links',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
              title: 'GitHub Repository',
              url: 'https://github.com/Jessetwo/HNGlinks',
              onTap: () => openLink('https://github.com/Jessetwo/HNGlinks'),
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
