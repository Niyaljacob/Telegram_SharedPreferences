import 'package:flutter/material.dart';
import 'package:telegram/main.dart';
import 'package:telegram/screen/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
   const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
 final _usernameController = TextEditingController();

 final _passwordController = TextEditingController();

 bool _isDataMatched = true;
 final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: const Color.fromARGB(255, 55, 52, 52),
        child: SafeArea(
          
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image(image: NetworkImage('https://imgs.search.brave.com/ge7GR_AweISvy78UKT6Jpby7mdIBS0L9z48sphrmJUc/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9hbmRy/b2lkbmF0dXJlLmNv/bS93cC1jb250ZW50/L3VwbG9hZHMvMjAy/My8wNC9UZWxlZ3Jh/bV8yMDE5X0xvZ28u/c3ZnXy53ZWJw'),
                    height: 150,),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Telegram',style: TextStyle(fontSize: 30),),
                  ),

                  //username
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Username',
                    ),
                    validator: (value) {
                      // if(_isDataMatched)
                      // {
                      //   return null;
                      // }else{
                      //   return 'Error';
                      // }
                      if(value == null || value.isEmpty){
                        return 'enter the Username';
                      }else{
                        return null;
                      }
                    },
                  ),
                 const SizedBox(height: 20,),

                 //password 
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                     decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password',
                    ),
                    validator: (value) {
                      // if(_isDataMatched)
                      // {
                      //   return null;
                      // }else{
                      //   return 'Error';
                      // }
                       if(value == null || value.isEmpty){
                        return 'enter the password';
                      }else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20,),
            
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: !_isDataMatched,
                        child: const Text(
                          'Username password doesnot match',style: TextStyle(color: Colors.red,),),
                      ),

                      //login button
                      ElevatedButton.icon(
                         
                        onPressed: () {
                          if(_formkey.currentState!.validate())
                          {
                            checkLogin(context);
                          }else{
                            // print('Data empty');
                          }
                         // checkLogin(context);
                        },
                         icon: const Icon(Icons.check), 
                         label: const Text('Login'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext context) async
  {
    final username = _usernameController.text;
    final password = _passwordController.text;
    if(username == password)
    {
      // print('Username Pass match');
//Go to home
final sharedPrefs = await SharedPreferences.getInstance();
await sharedPrefs.setBool(SAVE_KEY_NAME, true);
// ignore: use_build_context_synchronously
Navigator.of(context)
.pushReplacement(MaterialPageRoute(builder: (context1) => const ScreenHome()));
    }else{
      const errorMessage = 'Username Pass does not match';
      //snackbar
      ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          margin: EdgeInsets.all(10),
          content: Text(errorMessage)));
      // print('Username Pass does not match');

      // show text
      setState(() {
        _isDataMatched = false;
      });
    }
  }
}