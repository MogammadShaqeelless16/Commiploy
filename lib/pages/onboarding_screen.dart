
import 'package:commiploy/pages/intro%20screens/intro_page_1.dart';
import 'package:commiploy/pages/intro%20screens/intro_page_2.dart';
import 'package:commiploy/pages/intro%20screens/intro_page_3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Widgets/Menubar.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  PageController _controller = PageController();

  //keep track of the pages if we on the last packe
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: [
      PageView(
        controller: _controller,
        onPageChanged: (index){
          setState(() {
            onLastPage = (index == 2);
          });
        },
        children: [
          IntroPage1(),
          IntroPage2(),
          IntroPage3(),
        ],
      ),
        Container(
          alignment: Alignment(0,0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //skip
                GestureDetector(
                onTap: () {
                  _controller.jumpToPage(2);
                 },
                child: Text('Skip'),
                ),
                SmoothPageIndicator(controller: _controller, count: 3),

                //Next or Done
                onLastPage ?
                GestureDetector(
                  onTap: (){
                    _controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Text('Done'),
                )
                    :GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return Menubar();
                        },)
                      );
                    },
                    child: Text('Next'),
                ),
              ],
            )
        ),
      ],
      ),
    );
  }
}
