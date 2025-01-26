import 'package:flutter/material.dart';

class ExtraScreen extends StatelessWidget {
  const ExtraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Another Screen'),),
      body: Column(
        children: [
          Container(height: MediaQuery.of(context).size.height/8,
          width: MediaQuery.of(context).size.width,
            color: Colors.orangeAccent,
          ),
          SizedBox(
            height: 15,
          ),
          Container(height: MediaQuery.of(context).size.height/8,
            width: MediaQuery.of(context).size.width,
            color: Colors.orangeAccent,
          ),
          SizedBox(
            height: 15,
          ),
          Container(height: MediaQuery.of(context).size.height/8,
            width: MediaQuery.of(context).size.width,
            color: Colors.orangeAccent,

          ),
        ],
      ),
    );
  }
}
