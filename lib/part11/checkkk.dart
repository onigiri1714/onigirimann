import 'package:flutter/material.dart';
import 'package:test/part11/vhek.dart';
import 'package:test/part11/wake.dart';

final s = CheckboxSamplePage();

class Checkkk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 223, 176),
      appBar: AppBar(
          title: Text(
            "🍞",
            style: TextStyle(color: const Color.fromARGB(255, 247, 246, 246)),
          ),
          backgroundColor: const Color.fromARGB(255, 251, 223, 176)),
      body: Center(
          child: Column(
        children: [
          Text(
            'Lost and found!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 50,
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
            ),
          ),
          Padding(padding: EdgeInsets.all(20)),
          s,
          Padding(padding: EdgeInsets.all(30)),
          ElevatedButton(
            child: Text('Perfect?!'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Wake()),
              );
            },
          ),
        ],
      )),
    );
  }
}
