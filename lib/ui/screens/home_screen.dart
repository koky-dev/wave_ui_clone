import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wave_ui_clone/ui/colors.dart';
import 'package:wave_ui_clone/ui/components/card_button.dart';
import 'package:wave_ui_clone/ui/components/contacts_list.dart';
import 'package:wave_ui_clone/ui/components/test_stream.dart';
import 'package:wave_ui_clone/ui/components/transactions_list.dart';
import 'package:wave_ui_clone/ui/screens/settings.dart';
import 'package:wave_ui_clone/ui/screens/test_flutter_contacts.dart';
import 'package:wave_ui_clone/ui/screens/transfer/search_contact_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late bool showAmount;
  late String balance;

  @override
  void initState() {
    showAmount = true;
    balance = '150 000';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Color background = backgroundPurple;
    final Color fill = backroundGrey;
    final List<Color> gradient = [
      background,
      background,
      fill,
      fill,
    ];
    final double fillPercent = 55; // fills 56.23% for container from bottom
    final double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundPurple,
        centerTitle: true,
        elevation: 0.0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()));
              },
              icon: const Icon(Icons.settings),
            );
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              showAmount
                  ? balance
                  : '********', //balance.replaceAll(RegExp(r"."), "*"),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 5,
            ),
            MouseRegion(
              cursor: SystemMouseCursors.basic,
              child: GestureDetector(
                child: showAmount
                    ? const Icon(
                        Icons.visibility_off,
                        color: backroundGrey,
                      )
                    : const Icon(
                        Icons.visibility,
                        color: backroundGrey,
                      ),
                onTap: () {
                  setState(() {
                    showAmount = !showAmount;
                  });
                },
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            Padding(padding: EdgeInsets.only(top: 10)),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
            )
          ],
        ),
      ),
      //const SizedBox()
      body: Container(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.06),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradient,
            stops: stops,
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.25,
                padding: const EdgeInsets.only(
                  top: 12,
                  bottom: 10,
                  left: 65,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: skyBlue,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      child: QrImage(
                        data: 'User1',
                        size: 150,
                        backgroundColor: backroundGrey,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Positioned(
                      top: 80,
                      right: 8,
                      bottom: 5,
                      child: Image(
                        image: AssetImage('assets/logo.png'),
                        width: 50,
                        height: 50,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.92,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Bounceable(
                        child: const CardButton(
                          text: 'TRANSFERT',
                          icon: Icons.person,
                          color: backgroundPurple,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchContact(),
                            ),
                          );
                        },
                      ),
                      GestureDetector(
                        child: const CardButton(
                          text: 'PAIEMENT',
                          icon: Icons.shopping_cart,
                          color: orange,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ContactsList(),
                            ),
                          );
                        },
                      ),
                      GestureDetector(
                        child: const CardButton(
                          text: 'CREDIT',
                          icon: Icons.phone_android,
                          color: skyBlue,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const StreamTest(),
                            ),
                          );
                        },
                      ),
                    ]),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.89,
                child: Card(
                  child: TransactionsListComponent(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
