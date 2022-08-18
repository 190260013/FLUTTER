import 'package:apk_store/models/user.dart';
import 'package:apk_store/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyStore extends StatefulWidget {
  myUser user;

  MyStore({required this.user});

  @override
  _MyStoreState createState() => _MyStoreState();
}

class _MyStoreState extends State<MyStore> {
  final AuthService _authService = AuthService();
  int _act = 1;
  var source = {
    1: 'https://raw.github.com/renati-saathwick-reddy/Mystore/main/quizapp.apk',
    2: 'https://raw.github.com/renati-saathwick-reddy/Mystore/main/mycalci.apk',
    3: 'https://raw.github.com/renati-saathwick-reddy/Mystore/main/newsapp.apk',
  };

  void downld(int i) async {
    var url = source[i]!;
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('My APK Store'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              onPressed: () async {
                await _authService.signOut();
              },
              icon: Icon(Icons.logout),
              tooltip: "logout",
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/calculator.png',
                  height: 100,
                  width: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    downld(1);
                  },
                  child: Text('MyCalci'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/quiz.jpeg',
                  height: 100,
                  width: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    downld(2);
                  },
                  child: Text('Quiz App'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                  ),
                ),
              ],
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/news.jpg',
                  height: 100,
                  width: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    downld(3);
                  },
                  child: Text('News App'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                  ),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            Text(
              "USER ID:" + widget.user.uid,
            ),
            SizedBox(height: 10,),
            Text(
              "EMAIL:" + widget.user.email,
            ),
          ],
        ),
      ),
    );
  }
}
