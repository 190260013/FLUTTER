import 'package:apk_store/Mystore.dart';
import 'package:apk_store/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<myUser>(context);
    print(user.uid);
    if(user.uid == "null" || user == null){
      return Authenticate();
    }
    else{
      return MyStore(user:user);
    }
  }
}
