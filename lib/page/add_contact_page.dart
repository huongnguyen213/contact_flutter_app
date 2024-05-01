import 'package:flutter/material.dart';

class AddContactPage extends StatefulWidget {
  final Function(Map<String, String>) onContactAdded;

  AddContactPage({required this.onContactAdded});

  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Contact'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _numberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String name = _nameController.text;
                String number = _numberController.text;
                if (name.isNotEmpty && number.isNotEmpty) {
                  // Add new contact to the list
                  widget.onContactAdded({'name': name, 'number': number});
                  Navigator.pop(context); // Go back to previous screen
                } else {
                  // Show error message if name or number is empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please enter name and phone number.'),
                    ),
                  );
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
