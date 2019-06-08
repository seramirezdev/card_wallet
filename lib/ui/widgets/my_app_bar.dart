import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({String title, IconData leadingIcon, BuildContext context})
      : super(
            elevation: 0.0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                leadingIcon,
                color: Colors.black,
                size: 15.0,
              ),
            ));
}
