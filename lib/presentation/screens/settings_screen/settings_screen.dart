import 'package:flutter/material.dart';
import 'package:music_drift/presentation/screens/settings_screen/settings_about_us.dart';
import 'package:music_drift/presentation/screens/settings_screen/settings_license.dart';
import 'package:music_drift/presentation/screens/settings_screen/settings_privacy.dart';
import 'package:music_drift/presentation/screens/settings_screen/settings_reset.dart';
import 'package:music_drift/presentation/screens/settings_screen/settings_terms_and_conditions.dart';
import 'package:music_drift/widgets/bg.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Container(
            decoration: BoxDecoration(gradient: linearGradient()),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 0,
                title: const Text(
                  ' Settings',
                  style: TextStyle(
                      fontFamily: 'Iceberg',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      letterSpacing: 3,
                      fontStyle: FontStyle.italic),
                ),
                backgroundColor: Colors.transparent,
              ),
              body: ListView(
                padding: const EdgeInsets.only(
                    top: 25, bottom: 10, left: 2, right: 2),
                children: ListTile.divideTiles(context: context, tiles: [
                  ///////////////////-------------About Us ---------------------//////////////////////

                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('About Us'),
                    tileColor: const Color.fromRGBO(43, 0, 50, 0.592),
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    onTap: () {
                      AboutUs().aboutUs(context);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ///////////////////-------------Privacy ---------------------//////////////////////

                  ListTile(
                    leading: const Icon(Icons.privacy_tip_rounded),
                    title: const Text('Privacy Policy'),
                    tileColor: const Color.fromRGBO(43, 0, 50, 0.592),
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    onTap: () {
                      Privacy().privacy(context);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ///////////////////-------------License ---------------------//////////////////////

                  ListTile(
                    leading: const Icon(Icons.book),
                    title: const Text('License'),
                    tileColor: const Color.fromRGBO(43, 0, 50, 0.592),
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    onTap: () {
                      License().license(context);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ///////////////////-------------Terms And Conditions ---------------------//////////////////////

                  ListTile(
                    leading: const Icon(Icons.menu_book_sharp),
                    title: const Text('Terms And Conditions'),
                    tileColor: const Color.fromRGBO(43, 0, 50, 0.592),
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    onTap: () {
                      TermsAndConditions().termsandcondition(context);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ///////////////////-------------Reset App ---------------------//////////////////////

                  ListTile(
                    leading: const Icon(Icons.restart_alt_outlined),
                    title: const Text('Reset App'),
                    tileColor: const Color.fromRGBO(43, 0, 50, 0.592),
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    onTap: () {
                      resetApp(context);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ]).toList(),
              ),
            ),
          ),
        ),
        Container(
          color: const Color.fromRGBO(43, 0, 50, 1),
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 16),
          child: const Text(
            'V.1.0.1',
            style: TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
