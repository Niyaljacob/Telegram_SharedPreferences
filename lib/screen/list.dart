import 'package:flutter/material.dart';

class List2 extends StatelessWidget {
  final String name;

  const List2({super.key, required this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(name),
            const Text('last seen recently',style: TextStyle(
              fontSize: 15
            ),
            ),
          ],
        ),
        actions: [
           IconButton(
              icon: const Icon(Icons.call),
              onPressed: () {
                // Handle call icon tap
                // print('Call icon tapped');
              },
            ),
          
           IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                // Handle three-dot icon tap
                // print('Three-dot icon tapped');
              },
            ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://imgs.search.brave.com/XMtY9Ugm-hUxy_P3H_wihM8XOnUMeOqQcCl3gYMw0Lo/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzNlLzFj/LzQ1LzNlMWM0NTI1/ODViN2NhMmNkZWI3/MzA0YTlmNDUxODhl/LmpwZw'), // Replace with your image URL
              fit: BoxFit.cover,
            ),
          ),
        child: SafeArea(
          
          child: Center(
            child: Column(
              children: [
                Row(
                  
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                     style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 234, 70, 237)), // Set the background color
            ),
                      child: const Text('Hey! whats up?....'),
                    ),
                  ],
                ),
                 Row(
                  
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                       style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 234, 70, 237)), // Set the background color
            ),
                      child: const Text('All good here! what about you?'),
                    ),
                  ],
                ),
              ],
            ),
          ),
           ),
      ),
 );
}
}




