// import 'package:flutter/material.dart';
// import 'package:flash_chat/constants.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// final _firestore=Firestore.instance;
// FirebaseUser loggeInuser;
// class ChatScreen extends StatefulWidget {
//   static const String id='chat_screnn';
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   TextEditingController mesagetextcontroller=new TextEditingController();
//   final _auth=FirebaseAuth.instance;
//   String messagetex;
//
//
//
//
//   void getCurrentuser()async{
//   try{
//     final user=await _auth.currentUser();
//     if(user!=null){
//       loggeInuser=user;
//       print(loggeInuser.email);
//
//     }
//   }catch(e){
//     print(e);
//   }
//
//   }
//  //  void getmessages()async{
//  // final messages= await  _firestore.collection('messages').getDocuments();
//  // for(var  message in messages.documents){
//  //   print(message.data);
//  // }
//  //  }
//
//   // void emessagesStream()async{
//   //    await for(  var snapshot in _firestore.collection('messages').snapshots()){
//   //    for(var  message in snapshot.documents){
//   //     print(message.data);
//   //    }
//   //    }
//   // }
//   void messageStream() async {
//     await for (var snapshot in _firestore.collection('messages').snapshots()){
//       for (var message in snapshot.documents){
//         var messegeData = message.data;
//         var messageSender = messegeData['sender'];
//         var messageText = messegeData['text'];
//         print('this is messege sender $messageSender and this is message text $messageText');
//       }
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getCurrentuser();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.pinkAccent,
//       appBar: AppBar(
//         leading: null,
//         actions: <Widget>[
//           IconButton(
//               icon: Icon(Icons.close),
//               onPressed: () {
//                 messageStream();
//                 //Implement logout functionality
//                 // _auth.signOut();
//                 // Navigator.pop(context);
//               }),
//         ],
//         title: Text('⚡️Chat'),
//         backgroundColor: Colors.lightBlueAccent,
//       ),
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Messagestrem(),
//             // StreamBuilder<QuerySnapshot >(
//             // stream: _firestore.collection('messages').snapshots(),
//             //   builder: (context,snapshot){
//             //     List<Text> list_msg_wid = [];
//             //   if(snapshot.hasData) {
//             //     // return Center(
//             //     //   child: CircularProgressIndicator(
//             //     //     backgroundColor: Colors.lightBlueAccent,
//             //     //   ),
//             //     //
//             //     // );
//             //
//             //     final messages = snapshot.data.documents;
//             //
//             //     for (var message in messages ){
//             //       final messagetext = message['text'];
//             //       final meesagesende = message.data['sender'];
//             //
//             //       final msgwidget = Text("$messagetex from $meesagesende");
//             //       list_msg_wid.add(msgwidget);
//             //     }
//             //   }
//             //     return Column(
//             //       children: list_msg_wid,
//             //     );
//             //
//             //   },
//             // ),
//             //
//
//
//
//
//
//             Container(
//               decoration: kMessageContainerDecoration,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Expanded(
//                     child: TextField(
//                       controller: mesagetextcontroller,
//                       onChanged: (value) {
//
//                         //Do something with the user input.
//                         messagetex=value;
//                       },
//                       decoration: kMessageTextFieldDecoration,
//                     ),
//                   ),
//                   FlatButton(
//                     onPressed: () {
//                       mesagetextcontroller.clear();
//                       //Implement send functionality.
//                       //mesage text and we have user email logged user
//                              _firestore.collection('messages').add({
//                                'text':messagetex,
//                                'sender':loggeInuser.email
//                              });
//                     },
//                     child: Text(
//                       'Send',
//                       style: kSendButtonTextStyle,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
// class Messagebublle extends StatelessWidget {
//   final String msgtext;
//   final String sender;
//   final bool isme;
//   Messagebublle(this.msgtext,this.sender,this.isme);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//             Text(sender,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.black54
//             ),),
//           Material(
//             borderRadius: BorderRadius.circular(30),
//             elevation: 6,
//             color: isme? Colors.lightBlueAccent:Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
//               child: Text('$msgtext'
//
//
//
//                 ,
//                 style: TextStyle(
//                     color: Colors.white
//                 ),),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class Messagestrem extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return  StreamBuilder<QuerySnapshot>(
//       stream: _firestore.collection('messages').snapshots(),
//       builder: (context, snapshot){
//         List<Messagebublle> list_of_msg_bbule = [];
//         if(snapshot.hasData){
//           final messages = snapshot.data.documents;
//
//           for(var message in messages){
//             final messageData = message.data;
//             final messageText = messageData['text'];
//             final messageSender = messageData['sender'];
//             final curentuser=loggeInuser;
//             String x=curentuser.email;
//
//
//
//
//             final messagebubble =Messagebublle(messageText, messageSender,x==messageSender);
//             list_of_msg_bbule.add(messagebubble);
//           }
//         }
//         return Expanded(child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: ListView(
//             children: list_of_msg_bbule,
//           ),
//         ));
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  String messageText;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messageTextController.clear();
                      _firestore.collection('messages').add({
                        'text': messageText,
                        'sender': loggedInUser.email,
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.documents.reversed;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final messageText = message.data['text'];
          final messageSender = message.data['sender'];

          final currentUser = loggedInUser.email;

          final messageBubble = MessageBubble(
            sender: messageSender,
            text: messageText,
            isMe: currentUser == messageSender,
          );

          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.text, this.isMe});

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
        isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                topLeft: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0))
                : BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black54,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
