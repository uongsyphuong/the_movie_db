import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

import 'ui/signin/signin_screen.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Movie DB',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: (UniversalPlatform.isWeb) ? SignInScreen() : SignInScreen(),
    );
  }
}
