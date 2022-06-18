import 'package:commiploy/auth/main_page.dart';
import 'package:commiploy/pages/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState(){
    super.initState();
    _naviagatetohome();
  }

  _naviagatetohome() async{
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 100, width: 100, color: Colors.blue,),
            Container(
              child: Text('Splash Screen',
                style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )
              ),
            ),
          ],
        ),
      ) ,
    );
  }
}
