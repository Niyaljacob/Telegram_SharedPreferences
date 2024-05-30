
import 'package:flutter/material.dart';
import 'package:telegram/screen/list.dart';
import 'package:telegram/screen/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    
   return Scaffold(
    resizeToAvoidBottomInset: false,
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // print('Menu icon tapped');
            },
          ),
        title: const Text('Telegram'),

        actions: [
           IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Handle search icon tap
                // print('Search icon tapped');
              },
            ),

          IconButton(
              onPressed: () {
               showExitConfirmationDialog(context);
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return List2(name: 'person $index');
                    },
                  ));
                },
                leading: index % 2 == 0
                    ? const CircleAvatar(
                       
                       
                        backgroundImage: NetworkImage('https://imgs.search.brave.com/mW9J8ViblcLVdxtC5cdhP7Gn3lEpHjzt7DLtI3mbM_A/rs:fit:860:0:0/g:ce/aHR0cHM6Ly90ZWNo/bmlwYWdlcy1uZXcu/bXlzdGFnaW5nd2Vi/c2l0ZS5jb20vd3At/Y29udGVudC91cGxv/YWRzL3Byb2ZpbGUt/cGljLnBuZw'),
                      )
                    : Container(
                     decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://imgs.search.brave.com/gpl6JMJk4N22lkQDmI9oN3U1U-qt_xthhFuE7UqT6gY/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9zdG9y/YWdlLnBpeHRlbGxl/ci5jb20vZGVzaWdu/cy9kZXNpZ25zLWlt/YWdlcy8yMDE4LTA3/LTI5LzA2L3RodW1i/cy9wcm9maWxlLXBo/b3RlLWF2YXRhci1z/d2lybHktcHJvZHVj/dC1odW1hbi0xLTVi/NWRkZTljMTM3MGUu/cG5n'), // Replace with your image URL
              fit: BoxFit.cover,
            ),
          ),
                        width: 35,
                        height: 35,
                       
                        
                      ),
                title: Text('person ${index + 1}'),
              ),
              const Divider(height: 1),
            ],
             
          );
       

        },
     ),
     
     floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.create) ,
        onPressed: () {
          // print('create');
      } ,
      ),
    );
 }
}
  

  signout(BuildContext ctx) async{

    final sharedPrefs = await SharedPreferences.getInstance();
 await sharedPrefs.clear();
 
    // ignore: use_build_context_synchronously
    Navigator.of(ctx)
    .pushAndRemoveUntil(MaterialPageRoute(builder: (ctx1)=>ScreenLogin()), (route) => false);
  }


  void showExitConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Cancel button
            },
            child: const Text('Cancel', style: TextStyle(color: Colors.red),),
          ),
          TextButton(
            onPressed: () {
              signout(context);
            },
            child: const Text('Sign Out',style: TextStyle(color: Colors.red),),
          ),
        ],
      ),
 );
 }