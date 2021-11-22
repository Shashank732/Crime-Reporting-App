import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Section'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Help Section: ',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              '1. Click on the get instant help button to get instant help. Your location will be shared with the concerned authorities through SMS.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              '2. Click on the Report Crime button to Report the crime. Enter the required details with an image if possible and click on submit to mail it to the concerned authorities.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              '3. Visit the FAQ section to see if it helps with your query.',
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
