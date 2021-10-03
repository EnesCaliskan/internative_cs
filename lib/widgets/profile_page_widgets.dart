import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internative_cs/assets/constants.dart';

class ReturnBackButton extends StatelessWidget {
  const ReturnBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.indigo,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}

class ReturnProfileName extends StatelessWidget {
  const ReturnProfileName({Key? key, required this.fullName}) : super(key: key);
  final String fullName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, top: 20.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          fullName,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
            color: Colors.indigo,
          ),
        ),
      ),
    );
  }
}

class ReturnDescriptionPadding extends StatelessWidget {
  const ReturnDescriptionPadding({Key? key, required this.firstName, required this.lastName, required this.email, required this.birthday}) : super(key: key);
  final String firstName;
  final String lastName;
  final String email;
  final String birthday;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 40.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.all(30.0),
          height: MediaQuery.of(context).size.width * 0.9,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.indigo,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            child: Column(
                children: [
                  ReturnInfoBox(
                      infoName: 'First Name',
                      infoValue: firstName,
                      infoIcon: const Icon(Icons.looks_one, color: Colors.indigo,),),
                  const SizedBox(height: 10.0,),
                  ReturnInfoBox(
                    infoName: 'Last Name',
                    infoValue: lastName,
                    infoIcon: const Icon(Icons.looks_two, color: Colors.indigo,),),
                  const SizedBox(height: 10.0,),
                  ReturnInfoBox(
                    infoName: 'Email',
                    infoValue: email,
                    infoIcon: const Icon(Icons.email, color: Colors.indigo,),),
                  const SizedBox(height: 10.0,),
                  ReturnInfoBox(
                    infoName: 'Birthday',
                    infoValue: birthday.substring(0, birthday.length - 18),
                    infoIcon: const Icon(Icons.cake, color: Colors.indigo,),),
                ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReturnProfileImage extends StatelessWidget {
  const ReturnProfileImage({Key? key, required this.profileImage}) : super(key: key);
  final String profileImage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0.0, -0.4),
      child: CircleAvatar(
        backgroundImage: NetworkImage(profileImage),
        backgroundColor: Colors.transparent,
        radius: 80.0,
      ),
    );
  }
}

class ReturnInfoBox extends StatelessWidget {
  const ReturnInfoBox({Key? key, required this.infoName, required this.infoValue, required this.infoIcon}) : super(key: key);
  final Icon infoIcon;
  final String infoName;
  final String infoValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        infoIcon,
        Padding(
          padding: const EdgeInsets.only(left: 7.0),
          child: Text(infoName, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.indigo),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14.0),
          child: Text(infoValue, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.indigoAccent),
          ),
        ),
      ],
    );
  }
}

