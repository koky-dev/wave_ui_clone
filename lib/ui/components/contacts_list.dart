import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:permission_handler/permission_handler.dart';
import 'package:wave_ui_clone/ui/components/leading_icon_listile.dart';
import 'package:wave_ui_clone/utils/contact_utils.dart';
//import 'package:wave_ui_clone/utils/contact_utils.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();

    askContactsPermission();
    //getAllContacts();
  }

  getAllContacts() async {
    List<Contact> _contacts = (await ContactsService.getContacts(
            withThumbnails: false, photoHighResolution: false))
        .toList();

    setState(() {
      contacts = _contacts;
    });
  }

  askContactsPermission() async {
    final permission = await ContactUtils.getContactPermission();

    switch (permission) {
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.limited:
        goBackToHomePage();
        break;
      case PermissionStatus.granted:
        getAllContacts();
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).errorColor,
            content: const Text("Veuillez donner l'App l'accés aux contacts!"),
            duration: const Duration(seconds: 3),
          ),
        );
        break;
    }
  }

  goBackToHomePage() => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
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
                })
          ],
        ),
      ),
    );
    //)
  }
}
