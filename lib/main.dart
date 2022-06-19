import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:commiploy/auth/google_sign_in.dart';
import 'package:commiploy/firebase_options.dart';
import 'package:commiploy/auth/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

void main() async {
  // This sync data to the database
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
    child: MaterialApp(
      //Change all colors
      /*theme: ThemeData( primarySwatch: Colors.deepPurple),*/
       debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(splash: Container(child: Lottie.network('https://assets4.lottiefiles.com/packages/lf20_09346fcf.json', width: 250,)),  duration: 1000,
            splashTransition : SplashTransition.fadeTransition
          , nextScreen: MainPage()),
    ),
  );
}
