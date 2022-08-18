import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(home: MyCalci()));
}

class MyCalci extends StatefulWidget {
  const MyCalci({Key? key}) : super(key: key);

  @override
  _MyCalciState createState() => _MyCalciState();
}

class _MyCalciState extends State<MyCalci> {
  double? a, b;
  dynamic? ans ;
  int index=1,power=0;
  String x = '', y = '', z = '';
  void _clear(){
    setState(() {
      x = ''; y = '';z = '';ans='';
      index=1;
    });
  }
  void _operand(String st){
      setState(() {
        index=2;
        y= st;
      });
  }
  void _equal(){
    setState(() {
      if(y=='+')
      ans=double.parse(x)+double.parse(z);
      else if(y=='-')
        ans=double.parse(x)-double.parse(z);
      else if(y=='x')
        ans=double.parse(x)*double.parse(z);
      else if(y=='/')
        ans=double.parse(x)/double.parse(z);
      ans=double.parse((ans).toStringAsFixed(6));
      if(ans.abs()>1e9){
        power=0;
        while(ans.abs()>10){
          power+=1;ans/=10;
        }
        ans=double.parse((ans).toStringAsFixed(6));
        ans=ans.toString()+'e'+power.toString();
      }

    });
  }
  @override
  Widget build(BuildContext context) {

    //double v = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

      appBar: AppBar(
        title: Text('MyCalci'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Column(

          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Row(
                  //crossAxisAlignment:CrossAxisAlignment.stretch ,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$x $y $z',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
              Spacer(),
              Divider(
                thickness: 2,
              ),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text('Ans =',
                          style: TextStyle(
                            fontSize: 30.0,
                          )),
                    ),
                    Text(
                      ans != null ? '$ans' : '',
                      style: TextStyle(fontSize: 35.0,)
                    )
                  ],
                ),
              ),
            Spacer(),
            Container(
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.height*0.12,
                          onPressed: () {
                            setState(() {
                              index==1?x+='7':z+='7';
                            });
                          },
                          child: Text('7',style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black)),
                        ),
                      ),
                      Expanded(
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.height*0.12,
                          onPressed: () {
                            setState(() {
                              index==1?x+='8':z+='8';
                            });},
                          child: Text('8',style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black)),
                        ),
                      ),
                      Expanded(
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.height*0.12,
                          onPressed: () {
                            setState(() {
                              index==1?x+='9':z+='9';
                            });},
                          child: Text('9',style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black)),
                        ),
                      ),
                      Expanded(
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.height*0.12,
                          onPressed: ()=>_operand('/'),
                          child: Text('/',style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.height*0.12,
                          onPressed: () {
                            setState(() {
                              index==1?x+='4':z+='4';
                            });},
                          child: Text('4',style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black)),
                        ),
                      ),
                      Expanded(
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.height*0.12,
                          onPressed: () {
                            setState(() {
                              index==1?x+='5':z+='5';
                            });
                          },
                          child: Text('5',style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black)),
                        ),
                      ),
                      Expanded(
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.height*0.12,
                          onPressed: () {
                            setState(() {
                              index==1?x+='6':z+='6';
                            });},
                          child: Text('6',style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black)),
                        ),
                      ),
                      Expanded(
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.height*0.12,
                          onPressed: ()=>_operand('x'),
                          child: Text('x',style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.height*0.12,
                          onPressed: () {
                            setState(() {
                              index==1?x+='1':z+='1';
                            });},
                          child: Text('1',style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black)),
                        ),
                      ),
                      Expanded(
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.height*0.12,
                          onPressed: () {
                            setState(() {
                              index==1?x+='2':z+='2';
                            });},
                          child: Text('2',style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black)),
                        ),
                      ),
                      Expanded(
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.height*0.12,
                          onPressed: () {
                            setState(() {
                              index==1?x+='3':z+='3';
                            });
                          },
                          child: Text('3',style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black)),
                        ),
                      ),
                      Expanded(
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.height*0.12,
                          onPressed: ()=>_operand('-'),
                          child: Text('-',style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.height*0.12,
                          onPressed: () {
                            setState(() {
                              index==1?x+='.':z+='.';
                            });
                          },
                          child: Text(
                            '.',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black)),
                        ),
                      ),
                      Expanded(
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.height*0.12,
                          onPressed: () {
                            setState(() {
                              index==1?x+='0':z+='0';
                            });
                          },
                          child: Text('0',style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black)),
                        ),
                      ),
                      Expanded(
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.height*0.12,
                          onPressed: () {
                            setState(() {
                              index==1?x+='00':z+='00';
                            });
                            },
                          child: Text('00',style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black)),
                        ),
                      ),
                      Expanded(
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.height*0.12,
                          onPressed: ()=>_operand('+'),
                          child: Text('+',style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.height*0.12,
                          onPressed: _clear,
                          child: Text(
                            'Clear',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: Colors.red[800],
                          shape: RoundedRectangleBorder(

                              side: BorderSide(color: Colors.black)),
                        ),
                      ),
                      Expanded(
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.height*0.12,
                          onPressed: _equal,
                          child: Text('=',style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black)),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
    );
  }
}