// import 'package:flutter/material.dart';
// import 'package:flash_chat/screens/welcome_screen.dart';
// import 'package:flash_chat/screens/login_screen.dart';
// import 'package:flash_chat/screens/registration_screen.dart';
// import 'package:flash_chat/screens/chat_screen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// Future<void>main(){
//   WidgetsFlutterBinding.ensureInitialized();
//
//   runApp(FlashChat());
// }
//
// class FlashChat extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.light().copyWith(
//         textTheme: TextTheme(
//           bodyText1: TextStyle(color: Colors.black54),
//         ),
//       ),
//
//       initialRoute: WelcomeScreen.id,
//       routes: {
//         WelcomeScreen.id:(context)=>WelcomeScreen(),
//         ChatScreen.id:(context)=>ChatScreen(),
//
//         LoginScreen.id:(context)=>LoginScreen(),
//         RegistrationScreen.id:(context)=>RegistrationScreen(),
//
//
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}

