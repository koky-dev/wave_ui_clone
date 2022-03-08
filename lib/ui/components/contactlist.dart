import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:wave_ui_clone/ui/components/leading_icon_listile.dart';

class ContactTest extends StatefulWidget {
  const ContactTest({Key? key}) : super(key: key);

  @override
  _ContactTestState createState() => _ContactTestState();
}

class _ContactTestState extends State<ContactTest> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();

    //askContactsPermission();
    getAllContacts();
  }

  getAllContacts() async {
    List<Contact> _contacts = (await ContactsService.getContacts(
            withThumbnails: false, photoHighResolution: false))
        .toList();

    setState(() {
      contacts = _contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
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
                  title: Text('${contact.displayName}'),
                  subtitle: Text('${contact.phones!.elementAt(0).value}'),
                );
              }),
        ],
      ),
    );
  }
}
