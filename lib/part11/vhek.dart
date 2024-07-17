import 'package:flutter/material.dart';

class CheckboxSamplePage extends StatefulWidget {
  const CheckboxSamplePage({Key? key}) : super(key: key);

  @override
  State<CheckboxSamplePage> createState() => _CheckboxSamplePage();
}

class _CheckboxSamplePage extends State<CheckboxSamplePage> {
  final List<Map<String, dynamic>> _checkedMaps = [
    {'value': 'pencil box!', 'checked': false},
    {'value': 'PC!', 'checked': false},
    {'value': 'textbook!', 'checked': false},
    {'value': 'ここみ!', 'checked': false},
    {'value': 'Drink!', 'checked': false},
    {'value': 'bicycle-key!', 'checked': false},
  ];
  @override
  Widget build(BuildContext context) {
    final row = Column(
      children: _checkedMaps
          .map((e) => CheckboxListTile(
                value: e['checked'],
                title: Text(e['value']),
                subtitle: Text(e['checked'] ? "ok!" : "not!"),
                onChanged: (bool? checkedValue) {
                  setState(() {
                    e['checked'] = checkedValue;
                    if (e['checked'] == true) {
                      const snackBar = SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text('Perfect！'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    if (e['checked'] == false) {
                      const snackBar = SnackBar(
                        duration: Duration(seconds: 3),
                        content: Text('not!  It’s become~ No problem?'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                },
              ))
          .toList(),
    );

    return row;
  }
}
