//
// Generated file. Do not edit.
//

// ignore_for_file: lines_longer_than_80_chars

import 'package:connectivity_for_web/connectivity_for_web.dart';
import 'package:location_web/location_web.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  ConnectivityPlugin.registerWith(registrar);
  LocationWebPlugin.registerWith(registrar);
  SharedPreferencesPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
