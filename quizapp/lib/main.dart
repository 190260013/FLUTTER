import 'package:flutter/material.dart';
import 'question.dart';
import 'quiz.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int i = 0;
  int number_ques = 3;
  int complete=0;
  String quest = '';
  late bool answ;
  List<Widget> wl=[];
  Icon tick=Icon(
    Icons.check,
    color: Colors.green,
  );
  Icon wrong=Icon(
    Icons.close,
    color: Colors.red,
  );

  late question _question;
  late quiz _quiz;

  void _getques() {
    setState(() {
      quest = _question.question_i(i);
    });
  }
  void completed(){
    setState(() {
      complete=1;
    });
  }

  void _restart(){
    complete=0;
    setState(() {
      i=0;
      wl=[];
      _getques();
    });
  }
  void _checkans(bool x) async {

    setState(() async {

      answ = _quiz.ans_i(quest);
      if (answ==x){
          wl.add(tick);
      }
      else wl.add(wrong);

      i=i+1;
      if(i < number_ques)_getques();
      else {
        completed();
        await Future.delayed(Duration(seconds: 2));

        _restart();
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _question = new question();
    _quiz = new quiz();
    _getques();
    number_ques=_question.num_ques();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner : false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton.extended(

          tooltip: 'restart',
          onPressed: _restart ,
          label: Text('restart',
          style: TextStyle(
            fontSize: 20
          ),
          ),

          icon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.refresh,
              size: 50,



            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        backgroundColor: Colors.black,
        body: Container(

            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              quest,

                              //textAlign: TextAlign.center,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,

                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            child: MaterialButton(
                                color: Colors.green,
                                height: 60,

                                onPressed:(){ _checkans(true);},
                                child: Text(
                                  "True", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                                )
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            child: MaterialButton(

                                color: Colors.red,
                                height: 60,

                                onPressed:(){ _checkans(false);}
                                , child: Text(
                              "False", style: TextStyle(
                                color: Colors.white, fontSize: 25),
                            )
                            ),
                          )
                        ]
                    ),
                  ),
                  Wrap(


                    children: [... wl ],
                  )
                ],
              ),
            )

        ),
      ),
    );
  }
}
