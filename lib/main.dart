import 'package:flutter/material.dart';
import 'package:the_movie_db/src/app.dart';

import 'src/api/shared_prefs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  runApp(
    MyApp(),
  );
}
