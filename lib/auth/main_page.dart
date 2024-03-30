import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/auth/auth_page.dart';
import 'package:flutter_to_do_list/screen/home.dart';

class Main_Page extends StatelessWidget {
  const Main_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        //bat su kien (lag nnghe stream firebaseauth)
        stream: FirebaseAuth.instance
            .authStateChanges(), //lang nghe da dang nhap hay chua.
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // da dang nhap
            return Home_Screen();
          } else {
            //chua dang nhap
            return Auth_Page();
          }
        },
      ),
    );
  }
}
