import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FAQs'),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'FAQ Section: ',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              '1. Will my personal details be safe while reporting crime?\n Yes, your personal details will be safe and only your email id will be used. You can add your contact number if you want.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              '2. How will my location be shared if I use Get Instant Help Button?\n The link of your current location will be shared with concerned authorities through SMS',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              '3. Is this application issued by government?\n No, This application is made by students and not yet issued or supported by government.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
