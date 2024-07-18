import 'package:flutter/material.dart';
import 'package:test/part11/checkkk.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  List<TextEditingController> _controllers = [];
  List<Widget> _textFields = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 223, 176),
      appBar: AppBar(
        title: Text(
          'Return📝',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 251, 223, 176),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Lost item registration',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(11)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Please add the items you want to register.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(16)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  fixedSize: Size(150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    var controller = TextEditingController();
                    _controllers.add(controller);
                    _textFields.add(
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextField(
                          controller: controller,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: 'Enter an item',
                            suffixIcon: IconButton(
                              onPressed: () => controller.clear(),
                              icon: Icon(Icons.clear),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
                },
                icon: Icon(Icons.add),
                label: const Text('Add'),
              ),
              SizedBox(width: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.red,
                  fixedSize: Size(150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    if (_textFields.isNotEmpty) {
                      _controllers.removeLast();
                      _textFields.removeLast();
                    }
                  });
                },
                icon: Icon(Icons.remove),
                label: Text('Delete'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: _textFields.length,
              itemBuilder: (context, index) {
                return _textFields[index];
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              List<String> items = _controllers.map((controller) => controller.text).toList();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Checkkk(items: items),
                ),
              );
            },
            child: const Text('Register'),
          ),
          Padding(padding: const EdgeInsets.all(20)),
        ],
      ),
    );
  }
}
