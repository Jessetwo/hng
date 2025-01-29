import 'package:flutter/material.dart';
import 'package:hng/button.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  final String githubRepo = 'https://github.com/your-username/your-repo';
  final String hngHirePage = 'https://hng.tech/hire';
  final String telex = 'https://hng.tech/telex';
  final String delve = 'https://hng.tech/delve';

  const HomePage({super.key});

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HNG Flutter App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
              onTap: () => _launchURL(githubRepo),
              title: ('Go to GitHub Repository'),
            ),
            const SizedBox(height: 10),
            MyButton(
              onTap: () => _launchURL(hngHirePage),
              title: ('HNG Hire Page'),
            ),
            const SizedBox(height: 10),
            MyButton(
              onTap: () => _launchURL(telex),
              title: ('Telex'),
            ),
            const SizedBox(height: 10),
            MyButton(
              onTap: () => _launchURL(delve),
              title: ('Delve'),
            ),
          ],
        ),
      ),
    );
  }
}
