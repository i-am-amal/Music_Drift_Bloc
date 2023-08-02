import 'package:flutter/material.dart';

class License {
  license(context) {
    showLicensePage(
        context: context,
        applicationIcon: Image.asset(
          'assets/images/splash_screen_logo.png',
          height: 80,
        ),
        applicationName: 'MUSIC DRIFT',
        applicationVersion: 'V.1.0.1',
        applicationLegalese: 'Made with love from Amal(Brocamp)');
  }
}
