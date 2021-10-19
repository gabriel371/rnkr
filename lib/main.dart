import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localstore/localstore.dart';

import 'app/app.dart';

final db = Localstore.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(const App()));
}
