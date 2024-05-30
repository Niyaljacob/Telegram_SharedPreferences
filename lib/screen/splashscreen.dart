
import 'package:flutter/material.dart';
import 'package:telegram/main.dart';
import 'package:telegram/screen/homepage.dart';
import 'package:telegram/screen/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: Center(
      child:Image.network('https://imgs.search.brave.com/ge7GR_AweISvy78UKT6Jpby7mdIBS0L9z48sphrmJUc/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9hbmRy/b2lkbmF0dXJlLmNv/bS93cC1jb250ZW50/L3VwbG9hZHMvMjAy/My8wNC9UZWxlZ3Jh/bV8yMDE5X0xvZ28u/c3ZnXy53ZWJw'),
   ),
   );
  }


  // wating to login page
  Future<void> gotoLogin() async{
    await Future.delayed(const Duration(seconds: 6));
    // ignore: use_build_context_synchronously
    Navigator.of(context)
    .pushReplacement(MaterialPageRoute(
      builder: (context) => const ScreenLogin(),
    ),
    );
  }

  Future<void> checkUserLoggedIn() async{
    final sharedPrefs = await SharedPreferences.getInstance();
    final userLoggedIn = sharedPrefs.getBool(SAVE_KEY_NAME);
    if(userLoggedIn == null || userLoggedIn ==false)
    {
      gotoLogin();
    }else{
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx1) => const ScreenHome()),);
    }
  }
}