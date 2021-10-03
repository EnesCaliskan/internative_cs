import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internative_cs/assets/constants.dart';
import 'package:internative_cs/models/users.dart';
import 'package:internative_cs/widgets/profile_page_widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.users, required this.selectedIndex}) : super(key: key);
  final List<User> users;
  final int selectedIndex;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _random = new Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.only(left: 10.0, top: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: ReturnBackButton(),
                  ),
                  ReturnProfileName(fullName: widget.users[widget.selectedIndex].FullName),
                ],
              ),
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: gradients[_random.nextInt(gradients.length)],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.width * 1.3,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                color: Colors.white,
              ),
              child: ReturnDescriptionPadding(
                firstName: widget.users[widget.selectedIndex].FirstName,
                lastName: widget.users[widget.selectedIndex].LastName,
                email: widget.users[widget.selectedIndex].Email,
                birthday: widget.users[widget.selectedIndex].BirthDate,
              ),
            ),
          ),
          ReturnProfileImage(profileImage: widget.users[widget.selectedIndex].ProfilePhoto),
        ],
      ),
    );
  }
}
