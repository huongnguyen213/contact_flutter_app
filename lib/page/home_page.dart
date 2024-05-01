import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'add_contact_page.dart';
import 'contact_detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> contacts = [];

  @override
  void initState() {
    super.initState();
    loadContacts();
  }

  Future<void> loadContacts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? contactsJson = prefs.getString('contacts');
    if (contactsJson != null) {
      List<dynamic> decoded = jsonDecode(contactsJson);
      setState(() {
        contacts = decoded.map((e) => Map<String, String>.from(e)).toList();
      });
    }
  }

  Future<void> saveContacts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String contactsJson = jsonEncode(contacts);
    await prefs.setString('contacts', contactsJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search...',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    // Replace with contact image
                    child: Text(contacts[index]['name']![0]),
                  ),
                  title: Text(contacts[index]['name']!), // Replace with contact name
                  subtitle: Text(contacts[index]['number']!), // Replace with contact number
                  trailing: IconButton(
                    icon: Icon(Icons.phone),
                    onPressed: () {
                      // Call contact
                    },
                  ),
                  onTap: () {
                    // Navigate to contact detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactDetailPage(
                          contactName: contacts[index]['name']!,
                          contactNumber: contacts[index]['number']!,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add new contact page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddContactPage(
                onContactAdded: (Map<String, String> contact) {
                  setState(() {
                    contacts.add(contact);
                    saveContacts();
                  });
                },
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Recent Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contacts',
          ),
        ],
      ),
    );
  }
}
