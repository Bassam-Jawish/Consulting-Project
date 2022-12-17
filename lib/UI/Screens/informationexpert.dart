import 'package:consulting_app/UI/Screens/expertRegister_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:consulting_app/theme/theme.dart';
import 'dart:io';

var medicineController = TextEditingController();
var carrerController = TextEditingController();
var psychologyController = TextEditingController();
var familyController = TextEditingController();
var managementController = TextEditingController();
var descriptionController = TextEditingController();
var starttimeController = TextEditingController();
var endtimeController = TextEditingController();

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  int countcategory = 2;
  int counttime = 3;
  //category
  bool? ismedecine = false;
  bool? iscarrer = false;
  bool? ispsychology = false;
  bool? isfamily = false;
  bool? ismanagement = false;
//days
  bool? issunday = false;
  bool? ismonday = false;
  bool? istusday = false;
  bool? iswednesday = false;
  bool? isthursday = false;
  bool? isfriday = false;
  bool? issaturday = false;

  @override
  Widget build(BuildContext context) {
    double heightscreen = MediaQuery.of(context).size.height;
    double widthscreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ThemeColors.backgroundColor,
      appBar: null,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'more information',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 84, 44, 147)),
              ),
              SizedBox(
                height: heightscreen * 0.03,
              ),
              Text(
                'Choose the services you offer',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  backgroundColor: Color.fromARGB(50, 105, 22, 135),
                  // backgroundColor: Color.fromARGB(
                  //   100,
                  //   172,
                  //   122,
                  //   183,
                  // ),
                  // color: Color.fromARGB(255, 172, 122, 183),
                ),
              ),
              SizedBox(
                height: heightscreen * 0.03,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CheckboxListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Medicne',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 105, 22, 135),
                            //backgroundColor: Color.fromARGB(80, 172, 122, 183),
                          ),
                          textAlign: TextAlign.start,
                        ),
                        TextFormField(
                          controller: medicineController,
                          enabled: ismedecine,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'price',
                            prefixIcon: Icon(
                              Icons.price_change_outlined,
                              color: ThemeColors.icon,
                            ),
                          ),
                        ),
                      ],
                    ),

                    value: ismedecine,
                    onChanged: (newbool) {
                      setState(() {
                        ismedecine = newbool;

                        if (iscarrer == false)
                          return medicineController.clear();
                      });
                    },
                    // activeColor: Color.fromARGB(255, 80, 185, 166),
                    // checkColor: Colors.black,
                  ),
                  SizedBox(
                    height: heightscreen * 0.01,
                  ),
                  CheckboxListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Carreer',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 105, 22, 135),
                          ),
                          textAlign: TextAlign.start,
                        ),
                        TextFormField(
                          controller: carrerController,
                          keyboardType: TextInputType.number,
                          enabled: iscarrer,
                          decoration: const InputDecoration(
                            labelText: 'price',
                            prefixIcon: Icon(
                              Icons.price_change_outlined,
                              color: ThemeColors.icon,
                            ),
                          ),
                        ),
                      ],
                    ),
                    value: iscarrer,
                    onChanged: (newbool) {
                      setState(() {
                        iscarrer = newbool;
                        if (iscarrer == false) return carrerController.clear();
                      });
                    },
                    // activeColor: Color.fromARGB(255, 80, 185, 166),
                    // checkColor: Colors.black,
                  ),
                  SizedBox(
                    height: heightscreen * 0.01,
                  ),
                  CheckboxListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'psychology',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 105, 22, 135),
                          ),
                          textAlign: TextAlign.start,
                        ),
                        TextFormField(
                          controller: psychologyController,
                          keyboardType: TextInputType.number,
                          enabled: ispsychology,
                          decoration: const InputDecoration(
                            labelText: 'price',
                            prefixIcon: Icon(
                              Icons.price_change_outlined,
                              color: ThemeColors.icon,
                            ),
                          ),
                        ),
                      ],
                    ),
                    value: ispsychology,
                    onChanged: (newbool) {
                      setState(() {
                        ispsychology = newbool;
                        if (ispsychology == false)
                          return psychologyController.clear();
                      });
                    },
                    // activeColor: Color.fromARGB(255, 80, 185, 166),
                    // checkColor: Colors.black,
                  ),
                  SizedBox(
                    height: heightscreen * 0.01,
                  ),
                  CheckboxListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Family',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 105, 22, 135),
                          ),
                          textAlign: TextAlign.start,
                        ),
                        TextFormField(
                          controller: familyController,
                          keyboardType: TextInputType.number,
                          enabled: isfamily,
                          decoration: const InputDecoration(
                            labelText: 'price',
                            prefixIcon: Icon(
                              Icons.price_change_outlined,
                              color: ThemeColors.icon,
                            ),
                          ),
                        ),
                      ],
                    ),
                    value: isfamily,
                    onChanged: (newbool) {
                      setState(() {
                        isfamily = newbool;
                        if (isfamily == false) return familyController.clear();
                      });
                    },
                    // activeColor: Color.fromARGB(255, 80, 185, 166),
                    // checkColor: Colors.black,
                  ),
                  SizedBox(
                    height: heightscreen * 0.01,
                  ),
                  CheckboxListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Management',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 105, 22, 135),
                          ),
                          textAlign: TextAlign.start,
                        ),
                        TextFormField(
                          controller: managementController,
                          keyboardType: TextInputType.number,
                          enabled: ismanagement,
                          decoration: const InputDecoration(
                            labelText: 'price',
                            prefixIcon: Icon(
                              Icons.price_change_outlined,
                              color: ThemeColors.icon,
                            ),
                          ),
                        ),
                      ],
                    ),
                    value: ismanagement,
                    onChanged: (newbool) {
                      setState(() {
                        ismanagement = newbool;
                        if (ismanagement == false)
                          return managementController.clear();
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      //physics: NeverScrollableScrollPhysics(),
                      //reverse: true,
                      itemCount: countcategory,
                      itemBuilder: (context, i) => Addcatergory(i),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: heightscreen * 0.04,
              ),
              Text(
                'Your Experience',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  backgroundColor: Color.fromARGB(50, 105, 22, 135),
                ),
              ),
              SizedBox(
                height: heightscreen * 0.02,
              ),
              TextFormField(
                controller: descriptionController,
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                // minLines: null,
                decoration: InputDecoration(
                  labelText: "Decoration",
                  prefixIcon: const Icon(
                    Icons.info,
                    color: ThemeColors.icon,
                  ),
                  labelStyle: const TextStyle(
                    color: ThemeColors.highlight,
                  ),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35.0),
                    borderSide: const BorderSide(
                      color: ThemeColors.bordertextfromfiled,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 1.5),
                  ),
                ),
              ),
              SizedBox(
                height: heightscreen * 0.04,
              ),
              Text(
                'select your available time',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  backgroundColor: Color.fromARGB(50, 105, 22, 135),
                ),
              ),
              SizedBox(
                height: heightscreen * 0.03,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(children: [
                      Text('Sunday'),
                      Checkbox(
                        value: issunday,
                        onChanged: (newbool) {
                          setState(() {
                            issunday = newbool;
                          });
                        },
                      ),
                      // Checkbox(value: value, onChanged: onChanged)
                    ]),
                    SizedBox(
                      width: widthscreen * 0.05,
                    ),
                    Column(children: [
                      Text('Monday'),
                      Checkbox(
                        value: ismonday,
                        onChanged: (newbool) {
                          setState(() {
                            ismonday = newbool;
                          });
                        },
                      ),
                      // Checkbox(value: value, onChanged: onChanged)
                    ]),
                    SizedBox(
                      width: widthscreen * 0.05,
                    ),
                    Column(children: [
                      Text('Tusday'),
                      Checkbox(
                        value: istusday,
                        onChanged: (newbool) {
                          setState(() {
                            istusday = newbool;
                          });
                        },
                      ),
                      // Checkbox(value: value, onChanged: onChanged)
                    ]),
                    SizedBox(
                      width: widthscreen * 0.05,
                    ),
                    Column(children: [
                      Text('Wednesday'),
                      Checkbox(
                        value: iswednesday,
                        onChanged: (newbool) {
                          setState(() {
                            iswednesday = newbool;
                          });
                        },
                      ),
                      // Checkbox(value: value, onChanged: onChanged)
                    ]),
                    SizedBox(
                      width: widthscreen * 0.05,
                    ),
                    Column(children: [
                      Text('Thursday'),
                      Checkbox(
                        value: isthursday,
                        onChanged: (newbool) {
                          setState(() {
                            isthursday = newbool;
                          });
                        },
                      ),
                      // Checkbox(value: value, onChanged: onChanged)
                    ]),
                    SizedBox(
                      width: widthscreen * 0.05,
                    ),
                    Column(children: [
                      Text('Friday'),
                      Checkbox(
                        value: isfriday,
                        onChanged: (newbool) {
                          setState(() {
                            isfriday = newbool;
                          });
                        },
                      ),
                      // Checkbox(value: value, onChanged: onChanged)
                    ]),
                    SizedBox(
                      width: widthscreen * 0.05,
                    ),
                    Column(children: [
                      Text('Saturday'),
                      Checkbox(
                        value: issaturday,
                        onChanged: (newbool) {
                          setState(() {
                            issaturday = newbool;
                          });
                        },
                      ),

                      // Checkbox(value: value, onChanged: onChanged)
                    ]),
                  ],
                ),
              ),
              SizedBox(
                height: heightscreen * 0.02,
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  //physics: NeverScrollableScrollPhysics(),
                  //reverse: true,
                  itemCount: counttime,
                  itemBuilder: (context, j) => Addtime(j),
                ),
              ),
              SizedBox(
                height: heightscreen * 0.02,
              ),
              Center(
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: RadialGradient(radius: 4, colors: [
                      Color.fromARGB(255, 141, 68, 243),
                      Colors.purple
                    ]),
                    border: Border.all(
                      color: Color.fromARGB(255, 163, 33, 243),
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      // highlightColor: Colors.orange.withOpacity(0.3),
                      splashColor: ThemeColors.splashinkweel,
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        Navigator.of(context).pushNamed('/home');
                      },
                      child: const Center(
                          child: Text(
                        'Submet',
                        style: TextStyle(
                          color: ThemeColors.backgroundColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget Addcatergory(int i) {
    print(i);
    if (i == 0) {
      return Row(
        children: [
          Text(
            'Others :',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            height: 25,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: RadialGradient(
                  radius: 4,
                  colors: [Color.fromARGB(255, 141, 68, 243), Colors.purple]),
              border: Border.all(
                color: Color.fromARGB(255, 163, 33, 243),
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                // highlightColor: Colors.orange.withOpacity(0.3),
                splashColor: ThemeColors.splashinkweel,
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  setState(() {
                    countcategory++;
                  });
                },
                child: const Center(
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            height: 25,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: RadialGradient(
                  radius: 4,
                  colors: [Color.fromARGB(255, 141, 68, 243), Colors.purple]),
              border: Border.all(
                color: Color.fromARGB(255, 163, 33, 243),
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                // highlightColor: Colors.orange.withOpacity(0.3),
                splashColor: ThemeColors.splashinkweel,
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  if (countcategory > 1)
                    setState(() {
                      countcategory--;
                    });
                },
                child: const Center(
                    child: Text(
                  '-',
                  style: TextStyle(
                    fontSize: 22,
                    //fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'your consulting',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'price',
            ),
          ),
        ],
      );
    }
  }

  Widget Addtime(int j) {
    print(j);
    if (j == 0) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: 120,
              height: 50,
              child: TextFormField(
                controller: starttimeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Start Time",
                  labelStyle: const TextStyle(
                    color: ThemeColors.highlight,
                  ),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: ThemeColors.bordertextfromfiled,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 1.5),
                  ),
                ),
              )),
          SizedBox(
            width: 10,
          ),
          Container(
              width: 120,
              height: 50,
              child: TextFormField(
                controller: endtimeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "End Time",
                  labelStyle: const TextStyle(
                    color: ThemeColors.highlight,
                  ),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: ThemeColors.bordertextfromfiled,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 1.5),
                  ),
                ),
              )),
          SizedBox(
            width: 10,
          ),
          Row(
            children: [
              Container(
                height: 25,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: RadialGradient(radius: 4, colors: [
                    Color.fromARGB(255, 141, 68, 243),
                    Colors.purple
                  ]),
                  border: Border.all(
                    color: Color.fromARGB(255, 163, 33, 243),
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    // highlightColor: Colors.orange.withOpacity(0.3),
                    splashColor: ThemeColors.splashinkweel,
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      setState(() {
                        counttime++;
                      });
                    },
                    child: const Center(
                      child: Icon(Icons.add),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 25,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: RadialGradient(radius: 4, colors: [
                    Color.fromARGB(255, 141, 68, 243),
                    Colors.purple
                  ]),
                  border: Border.all(
                    color: Color.fromARGB(255, 163, 33, 243),
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    // highlightColor: Colors.orange.withOpacity(0.3),
                    splashColor: ThemeColors.splashinkweel,
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      setState(() {
                        counttime--;
                      });
                    },
                    child: const Center(
                        child: Text(
                      '-',
                      style: TextStyle(
                        fontSize: 22,
                        //fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(children: [
            Container(
                width: 120,
                height: 50,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Start Time",
                    labelStyle: const TextStyle(
                      color: ThemeColors.highlight,
                    ),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: ThemeColors.bordertextfromfiled,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.5),
                    ),
                  ),
                )),
            SizedBox(
              width: 10,
            ),
            Container(
                width: 120,
                height: 50,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "End Time",
                    labelStyle: const TextStyle(
                      color: ThemeColors.highlight,
                    ),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: ThemeColors.bordertextfromfiled,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.5),
                    ),
                  ),
                )),
          ]),
        ],
      );
    }
  }
}
