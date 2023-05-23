import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_flutter/screens/feed_screen.dart';
import 'package:tiktok_flutter/screens/services/auth.dart';
import 'package:tiktok_flutter/screens/wrapper.dart';
import 'package:tiktok_flutter/service_locator.dart';
import 'package:tiktok_flutter/model/tiktok_user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<TikTokUser>.value(
      value: AuthService().user,
      initialData: new TikTokUser(uid: ""),
      child: MaterialApp(
          debugShowCheckedModeBanner: false, home: Wrapper() //FeedScreen(),
          ),
    );
  }
}
