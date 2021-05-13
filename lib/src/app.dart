import 'package:flutter/material.dart';
import 'package:the_movie_db/src/ui/onboarding/onboarding_screen.dart';
import 'package:the_movie_db/src/ui/signin/signin_screen.dart';

import 'api/shared_prefs.dart';

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
      home: SharedPrefs().isFirstTime ? OnBoardingScreen() : SignInScreen(),
    );
  }
}
