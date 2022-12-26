import 'package:consulting_app/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

var emailController = TextEditingController();

var numberController = TextEditingController();
var roleController = TextEditingController();
var fullnameControoler = TextEditingController();

class PublicUserProfileScreen extends StatefulWidget {
  const PublicUserProfileScreen({super.key});

  @override
  State<PublicUserProfileScreen> createState() =>
      _PublicUserProfileScreenState();
}

class _PublicUserProfileScreenState extends State<PublicUserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double heightscreen = MediaQuery.of(context).size.height;
    double widthscreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ThemeColors.icons),
        backgroundColor: Color.fromARGB(255, 205, 171, 221),
        /*leading: Icon(
                       Icons.menu,
                        color: ThemeColors.icons,
                  ),*/
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
          icon: Icon(Icons.chevron_left),
        ),
        title: Text(
          'name Profile',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        elevation: 5.0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: ThemeColors.icons,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.message,
              color: ThemeColors.icons,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/messege');
            },
          ),
        ],
      ),
      backgroundColor: ThemeColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 65.0,
                      backgroundColor: Color.fromARGB(255, 200, 119, 238),
                    ),
                    Container(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(100),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/imageprofile.jpeg",
                              width: 115,
                              height: 115,
                              fit: BoxFit.cover,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: heightscreen * 0.04,
            ),
            Row(
              children: [
                Text(
                  ' Role:',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.icon,
                  ),
                ),
                SizedBox(
                  width: 24,
                ),
                Container(
                  height: 40,
                  width: widthscreen * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(180, 205, 171, 221),
                  ),
                  child: Center(
                    child: Text(
                      'ffffkjkjkjkjkj',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 46, 42, 44)),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
