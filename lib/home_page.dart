import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  final String githubRepo = 'https://github.com/your-username/your-repo';
  final String hngHirePage = 'https://hng.tech/hire';
  final String telex = 'https://hng.tech/telex';
  final String delve = 'https://hng.tech/delve';

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
        title: Text(
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
            ElevatedButton(
              onPressed: () => _launchURL(githubRepo),
              child: Text('Go to GitHub Repository'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _launchURL(hngHirePage),
              child: Text('HNG Hire Page'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _launchURL(telex),
              child: Text('Telex'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _launchURL(delve),
              child: Text('Delve'),
            ),
          ],
        ),
      ),
    );
  }
}
