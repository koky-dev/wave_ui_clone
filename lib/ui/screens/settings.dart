import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Paramètres',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: const [
                ListTile(
                  leading: Icon(
                    Icons.account_balance,
                    color: Colors.black,
                  ),
                  title: Text('Lier votre banque'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.share,
                    color: Colors.black,
                  ),
                  title: Text('Inviter un ami à rejoindre Wave'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.black,
                  ),
                  title: Text('Appeler le service client gratuitement'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.room,
                    color: Colors.black,
                  ),
                  title: Text('Trouver les agents à proximité'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.content_paste,
                    color: Colors.black,
                  ),
                  title: Text('Vérifier votre plafond'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.security,
                    color: Colors.black,
                  ),
                  title: Text('Modifier votre code secret'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.auto_awesome,
                    color: Colors.black,
                  ),
                  title: Text('Utiliser le code promotionnel'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  title: Text('Se déconnecter'),
                ),
              ],
            ),
            // Copyright Text
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('UBA'),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Ecobank'),
                  ],
                ),
                const Text('Conditions Générales'),
                const Text('Version 22.02.22-e07b7c'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
