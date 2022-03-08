import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:wave_ui_clone/ui/components/leading_icon_listile.dart';

class TestFlutterContact extends StatefulWidget {
  const TestFlutterContact({Key? key}) : super(key: key);

  @override
  _TestFlutterContactState createState() => _TestFlutterContactState();
}

class _TestFlutterContactState extends State<TestFlutterContact> {
  List<Contact> contacts = [];
  @override
  void initState() {
    super.initState();

    getAllContactFlutter();
  }

  getAllContactFlutter() async {
    List<Contact> _contacts = (await FlutterContacts.getContacts()).toList();

    setState(() {
      contacts = _contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Envoyer de l'argent",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
          //child: Column(
          //children: [
          //const Text('Contacts'),
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: contacts.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                Contact contact = contacts[index];
                return ListTile(
                  leading: const LeadingIcon(
                    containerColor: Colors.grey,
                    icon: Icons.person,
                    iconColor: Colors.black,
                  ),
                  title: Text('${contact.name}'),
                  //subtitle: Text('${contact.phones!.elementAt(0).value}'),
                );
              })
          //],
          //),
          ),
    );
  }
}
