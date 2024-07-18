import 'package:flutter/material.dart';
import 'package:test/part11/checkkk.dart';
import 'package:test/part11/create.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 223, 176),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            Text(
              'Remember it!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 60,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
              ),
            ),
            Image.asset('assets/images/image.jpg'),
            Center(
                child: Align(
                    alignment: Alignment(0, 0.5),
                    child: CarouselSlider(
                        options: CarouselOptions(
                          height: 90,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.5,
                        ),
                        items: [
                          ElevatedButton(
                            child: Text('cheak!'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Checkkk()),
                              );
                            },
                          ),
                          ElevatedButton(
                            child: Text('create!'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateScreen()),
                              );
                            },
                          ),
                        ])))
          ])),
    );
  }
}
