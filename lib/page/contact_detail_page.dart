import 'package:flutter/material.dart';

class ContactDetailPage extends StatelessWidget {
  final String contactName;
  final String contactNumber;

  ContactDetailPage({required this.contactName, required this.contactNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              // Replace with contact image
              child: Text(contactName[0]),
            ),
            SizedBox(height: 20),
            Text(
              contactName,
              style: TextStyle(fontSize: 24),
            ),
            Text(
              contactNumber,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
