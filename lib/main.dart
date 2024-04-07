import 'package:flutter/material.dart';

void main() {
  runApp(const ContactsApp());
}

class ContactsApp extends StatelessWidget {
  const ContactsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Contacts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ContactListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(contacts[index].avatar),
            ),
            title: Text(contacts[index].name),
            subtitle: Text(contacts[index].phoneNumber),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ContactDetailScreen(contact: contacts[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ContactDetailScreen extends StatelessWidget {
  final Contact contact;

  const ContactDetailScreen({Key? key, required this.contact})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contact.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (contact.avatar.isNotEmpty)
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage(contact.avatar),
                  radius: 50,
                ),
              ),
            const SizedBox(height: 20),
            Text('Phone Number: ${contact.phoneNumber}',
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class Contact {
  final String name;
  final String phoneNumber;
  final String avatar;

  const Contact({
    required this.name,
    required this.phoneNumber,
    this.avatar = '',
  });
}

final List<Contact> contacts = [
  const Contact(
      name: 'Contact 1',
      phoneNumber: '123456789',
      avatar: 'lib/img/contact.png'),
  const Contact(
      name: 'Contact 2',
      phoneNumber: '123456789',
      avatar: 'lib/img/contact.png'),
  const Contact(
      name: 'Contact 3',
      phoneNumber: '123456789',
      avatar: 'lib/img/contact.png'),
  const Contact(
      name: 'Contact 4',
      phoneNumber: '123456789',
      avatar: 'lib/img/contact.png'),
  const Contact(
      name: 'Contact 5',
      phoneNumber: '123456789',
      avatar: 'lib/img/contact.png'),
];