import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
class signup extends StatelessWidget {
  signup({Key? key}) : super(key: key);

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("SIGN UP"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 30,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height:30,),
            SizedBox(
              
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: (){
                  // var usernameController;
                  // var passwordController;
                  createAccount(
                       userName: usernameController.text.trim(),
                         password: passwordController.text.trim());
                }, child:Text("Create")
              
              ),
            ),
            
         
          ],
        ),
      ),
    );
  }

// @override
  Future<void> createAccount(
      {required String userName, required String password}) async {
    try {
      final dio = Dio();
      final response =
          await dio.post('https://bookstore.demoqa.com/Account/v1/User', data: {
        "userName": userName,
        "password": password,
      });

  print(response.toString());
  } catch(e, s){
    print('$e$s');
    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("An error Occured")));
  }

}
}


