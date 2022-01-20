// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flash_chat/componants/roundede_btn.dart';
// import 'package:flash_chat/screens/login_screen.dart';
// import 'package:flash_chat/screens/registration_screen.dart';
// import 'package:flutter/material.dart';
//
// class WelcomeScreen extends StatefulWidget {
//   static const String id='welcome_screnn';
//   @override
//   _WelcomeScreenState createState() => _WelcomeScreenState();
// }
//
// class _WelcomeScreenState extends State<WelcomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightBlueAccent,
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Row(
//               children: <Widget>[
//                 Hero(
//                   tag: 'logo',
//                   child: Container(
//                     child: Image.asset('images/logo.png'),
//                     height: 60.0,
//                   ),
//                 ),
//                 TypewriterAnimatedTextKit(
//
//
//                     text: ['Flash Chat'],
//                     textStyle: TextStyle(
//                       color: Colors.black,
//                       fontSize: 45.0,
//                       fontWeight: FontWeight.w900,
//                     ),
//                   ),
//
//               ],
//             ),
//             SizedBox(
//               height: 48.0,
//             ),
//             // Padding(
//             //   padding: EdgeInsets.symmetric(vertical: 16.0),
//             //   child: Material(
//             //     elevation: 5.0,
//             //     color: Colors.lightBlueAccent,
//             //     borderRadius: BorderRadius.circular(30.0),
//             //     child: MaterialButton(
//             //       onPressed: () {
//             //         //Go to login screen.
//             //         Navigator.pushNamed(context,LoginScreen.id);
//             //       },
//             //       minWidth: 200.0,
//             //       height: 42.0,
//             //       child: Text(
//             //         'Log In',
//             //       ),
//             //     ),
//             //   ),
//             // ),
//             RoundedButton(
//               color: Colors.lightBlueAccent,
//               title: "Login",
//               onPressed: (){
//                 Navigator.pushNamed(context,LoginScreen.id);
//               },
//             ),
//             RoundedButton(
//               title: "Register",
//               color: Colors.blueAccent,
//               onPressed: (){Navigator.pushNamed(context,RegistrationScreen.id);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flash_chat/componants/roundede_btn.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Chat Point'],
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
              title: 'Log In',
              color: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              title: 'Register',
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
            SizedBox(
              height: 100,
            )
            ,
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Made with ❤ by Sai"
                  ,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1
                    ),
                  )
                ],
              ),
            )
          ],
          
        ),
      ),
    );
  }
}
