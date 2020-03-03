import 'package:flutter/material.dart';
import 'sign_up_screen.dart';
import 'login_screen.dart';
import 'package:bety_main_app/componets/rounded_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {

    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,

    );
    animation = ColorTween(begin: Colors.blueGrey,end: Colors.white).animate(controller);
    controller.forward();
    animation.addStatusListener((status){

    });
    controller.addListener((){
      setState(() {});

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/bety_logo.jpg'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text:['Bety'],
                  speed: Duration(milliseconds: 500),
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              buttonTittle: 'Log In',
              colour: Colors.lightBlueAccent,
              onPressed: (){
                Navigator.pushNamed(context,LoginScreen.id);
              },
            ),
            RoundedButton(
              buttonTittle: 'Sign Up',
              colour: Colors.blueAccent,
              onPressed: (){
                Navigator.pushNamed(context,SignupScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}