import 'package:flutter/material.dart';
import 'package:test/part11/wake.dart';

class Checkkk extends StatefulWidget {
  final List<String> items;

  Checkkk({this.items = const []});

  @override
  _CheckkkState createState() => _CheckkkState();
}

class _CheckkkState extends State<Checkkk> {
  List<bool> _checkedStates = [];
  List<bool> _commentStates = [];

  @override
  void initState() {
    super.initState();
    _checkedStates = List<bool>.filled(widget.items.length, false);
    _commentStates = List<bool>.filled(widget.items.length, false);
  }

  bool get allChecked => _checkedStates.every((checked) => checked);

  void _onCheckboxChanged(int index, bool? value) {
    setState(() {
      _checkedStates[index] = value ?? false;
      _commentStates[index] = value ?? false;
    });
  }

  void _onPerfectPressed() {
    if (allChecked) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Wake()),
      );
    } else {
      const snackBar = SnackBar(
        content: Text(
          'Please check all items before proceeding.',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 223, 176),
      appBar: AppBar(
        title: Text(
          "Return📝",
          style: TextStyle(color:  Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 251, 223, 176),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'What do you bring today?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
              ),
            ),
            Padding(padding: EdgeInsets.all(20)),
            Expanded(
              child: ListView.builder(
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  return CheckboxListTileItem(
                    item: widget.items[index],
                    isChecked: _checkedStates[index],
                    showComment: _commentStates[index],
                    onChanged: (bool? value) {
                      _onCheckboxChanged(index, value);
                    },
                  );
                },
              ),
            ),
            Padding(padding: EdgeInsets.all(30)),
            ElevatedButton(
              child: Text('Perfect?!'),
              onPressed: _onPerfectPressed,
            ),
          ],
        ),
      ),
    );
  }
}

class CheckboxListTileItem extends StatelessWidget {
  final String item;
  final bool isChecked;
  final bool showComment;
  final ValueChanged<bool?> onChanged;

  CheckboxListTileItem({
    required this.item,
    required this.isChecked,
    required this.showComment,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Checkbox(
            value: isChecked,
            onChanged: onChanged,
          ),
          title: Text(item),
        ),
        if (showComment)
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Nice!',
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
          ),
      ],
    );
  }
}
