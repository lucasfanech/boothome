import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 100.0,
          width: 300.0,
          color: Colors.blue,
          child: const Center(
            child: Text(
              'Calendar',
              style: TextStyle(fontSize: 24.0, color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Container(
          height: 100.0,
          width: 300.0,
          color: Colors.blue,
          child: const Center(
            child: Text(
              'Notes',
              style: TextStyle(fontSize: 24.0, color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Container(
          height: 100.0,
          width: 300.0,
          color: Colors.blue,
          child: const Center(
            child: Text(
              'Messages',
              style: TextStyle(fontSize: 24.0, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}