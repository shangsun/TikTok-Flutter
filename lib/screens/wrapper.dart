import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_flutter/model/tiktok_user.dart';
import 'package:tiktok_flutter/screens/authenticate/authenticate.dart';
import 'package:tiktok_flutter/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return either root or Authenticate widget
    final user = Provider.of<TikTokUser>(context);
    print(user);

    if (user.uid.isEmpty) {
      return Authenticate();
    }

    return Home();
  }
}
