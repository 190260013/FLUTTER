import 'package:apk_store/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final VoidCallback toggle;
  SignIn({required this.toggle});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

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
        title: Text('Sign In'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.how_to_reg),
            onPressed: () {
              widget.toggle();
            },
            label: Text("Register"),
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                TextFormField(
                  validator: (value) => value!.length < 2 ? "enter a email" : null,
                  onChanged: (value){
                    setState(() {
                      email = value;
                    });
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  validator: (value)  => value!.length < 6 ? 'Password length > 6' : null,
                  obscureText: true,
                  onChanged: (value){
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
                        dynamic result = await _authService.signIn(
                            email: email,
                            password: password
                        );
                        if(result == null){
                          setState(() {
                            error = 'Please supply a valid email/password';
                          });
                        }
                      }
                    },
                    child: Text(
                        "Sign In"
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
