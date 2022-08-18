import 'package:flutter/material.dart';
import 'package:apk_store/services/auth.dart';

class Register extends StatefulWidget {
  final VoidCallback toggle;
  Register({required this.toggle});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.brown[100],
      appBar: AppBar(
        //backgroundColor: Colors.brown[400],
        elevation: 10.0,
        title: Text('Sign Up'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.login),
            onPressed: () {
              widget.toggle();
            },
            label: Text("Sign In"),
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                TextFormField(
                  validator: (value) => value!.length < 2 ? "enter a email" : null,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  validator: (value)  => value!.length < 6 ? 'Password length > 6' : null,
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                    onPressed: () async {
                      if(_formKey.currentState!.validate()){
                        print(email);
                        print(password);
                        dynamic result = await _authService.signUp(
                            email: email,
                            password: password
                        );
                        if(result == null){
                          setState(() {
                            error = 'please supply a valid email';
                          });
                        }
                      }
                    },
                    child: Text(
                        "Register"
                    )),
                SizedBox(height:10),
                Text(
                  error,
                  style: TextStyle(
                    color: Colors.red
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
