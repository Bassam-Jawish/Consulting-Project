//ExpertProfileScreen
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:consulting_app/Bloc/consulting_cubit.dart';
import 'package:consulting_app/Bloc/consulting_state.dart';
import 'package:consulting_app/Bloc/register/register_cubit.dart';
import 'package:consulting_app/Bloc/register/register_state.dart';
import 'package:consulting_app/UI/Components/constants.dart';
import 'package:consulting_app/UI/Screens/expert_profile.dart';
import 'package:consulting_app/UI/Screens/user_profile.dart';
import 'package:consulting_app/network/local/cash_helper.dart';
import 'package:consulting_app/theme/theme.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../Components/components.dart';
import 'expertRegister_screen.dart';

var emailController = TextEditingController();

var numberController = TextEditingController();
var roleController = TextEditingController();
var fullnameControoler = TextEditingController();
var formKey = GlobalKey<FormState>();

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double heightscreen = MediaQuery.of(context).size.height;
    double widthscreen = MediaQuery.of(context).size.width;
    return BlocConsumer<ConsultingCubit, ConsultingStates>(
      listener: (context, state) {},
      builder: (
        //var model = ConsultingCubit.get(context).userDataModel;

        // fullnameController.text = model!.data!.user!.name!;
        // emailController.text = model.data!.user!.email!;
        // numberController.text = model.data!.user!.phone!;
        // if (model.data!.user!.isExp == 1)
        //   roleController.text = 'Expert';
        // else
        //   roleController.text = 'User';
        context,
        state,
      ) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: ThemeColors.icons),
            backgroundColor: Color.fromARGB(255, 205, 171, 221),
            /*leading: Icon(
                       Icons.menu,
                        color: ThemeColors.icons,
                  ),*/

            title: Text(
              '     My Profile',
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
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Stack(
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
                ),
                SizedBox(
                  height: heightscreen * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              ' My Role:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: ThemeColors.icon,
                              ),
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Expanded(
                                child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              readOnly: true,
                              enabled: false,
                              controller: roleController,
                              keyboardType: TextInputType.text,
                              onFieldSubmitted: (String value) {
                                print(value);
                              },
                              decoration: InputDecoration(
                                //labelText: "Full Name",
                                prefixIcon: const Icon(
                                  Icons.roller_shades_sharp,
                                  color: ThemeColors.icon,
                                ),
                                // labelStyle: const TextStyle(
                                //   color: ThemeColors.highlight,
                                // ),
                                fillColor: Colors.white,
                                // focusedBorder: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(35.0),
                                //   borderSide: const BorderSide(
                                //     color: ThemeColors.bordertextfromfiled,
                                //   ),
                                // ),
                                // enabledBorder: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(25.0),
                                //   borderSide: const BorderSide(
                                //     color: Colors.black,
                                //     width: 1.5,
                                //   ),
                                // ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            )),
                          ],
                        ),
                        SizedBox(
                          height: heightscreen * 0.04,
                        ),
                        Row(
                          children: [
                            Text(
                              ' My Name:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: ThemeColors.icon,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              readOnly: true,
                              enabled: false,
                              controller: fullnameController,
                              keyboardType: TextInputType.text,
                              onFieldSubmitted: (String value) {
                                print(value);
                              },
                              decoration: InputDecoration(
                                //labelText: "Full Name",
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: ThemeColors.icon,
                                ),
                                // labelStyle: const TextStyle(
                                //   color: ThemeColors.highlight,
                                // ),
                                fillColor: Colors.white,
                                // focusedBorder: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(35.0),
                                //   borderSide: const BorderSide(
                                //     color: ThemeColors.bordertextfromfiled,
                                //   ),
                                // ),
                                // enabledBorder: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(25.0),
                                //   borderSide: const BorderSide(
                                //     color: Colors.black,
                                //     width: 1.5,
                                //   ),
                                // ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 1.5,
                                  ),
                                ),
                                // errorBorder: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(25.0),
                                //   borderSide: const BorderSide(
                                //     color: Colors.red,
                                //     width: 1.5,
                                //   ),
                                // ),
                              ),
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return 'Please enter your first name';
                              //   }
                              //   if (RegExp(r"[!@#<>?':_`~ ١٢٣٤٥٦٧٨٩٠؛،؟.,/;[\]\\|=+)(*&^%0-9-]")
                              //           .hasMatch(value) ||
                              //       RegExp(r'[!@#<>?":_`~.,/;{}€£¥₩°•○●□■♤♡◇♧☆▪️¤《》¡¿$÷×[\]\\|=+)(*&^%0-9-]')
                              //           .hasMatch(value)) {
                              //     return 'Invalid first name';
                              //   }
                              //   if (value.length > 20) {
                              //     return 'You reached the maximum length';
                              //   }
                              //   return null;
                              // },
                            )),
                          ],
                        ),
                        SizedBox(
                          height: heightscreen * 0.04,
                        ),
                        Row(
                          children: [
                            Text(
                              'My Email:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: ThemeColors.icon,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: emailController,
                                readOnly: true,
                                enabled: false,
                                keyboardType: TextInputType.emailAddress,
                                onFieldSubmitted: (String value) {
                                  print(value);
                                },
                                decoration: InputDecoration(
                                  //labelText: "Your Email",
                                  prefixIcon: const Icon(
                                    Icons.email,
                                    color: ThemeColors.icon,
                                  ),
                                  labelStyle: const TextStyle(
                                    color: ThemeColors.highlight,
                                    fontSize: 25,
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
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 1.5,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 1.5,
                                    ),
                                  ),
                                  // errorBorder: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.circular(25.0),
                                  //   borderSide: const BorderSide(
                                  //     color: Colors.red,
                                  //     width: 1.5,
                                  //   ),
                                  // ),
                                ),
                                // validator: (value) {
                                //   if (!EmailValidator.validate(value!)) {
                                //     return 'Please enter a valid Email';
                                //   }
                                //   return null;
                                // },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: heightscreen * 0.04,
                        ),
                        Row(
                          children: [
                            Text(
                              'My Phone:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: ThemeColors.icon,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                readOnly: true,
                                enabled: false,
                                controller: numberController,
                                keyboardType: TextInputType.phone,
                                onFieldSubmitted: (String value) {
                                  print(value);
                                },
                                decoration: InputDecoration(
                                  //labelText: "Your phone",
                                  prefixIcon: const Icon(
                                    Icons.phone,
                                    color: ThemeColors.icon,
                                  ),
                                  // labelStyle: const TextStyle(
                                  //   color: ThemeColors.highlight,
                                  //   fontSize: 20,
                                  // ),
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35.0),
                                    borderSide: const BorderSide(
                                      color: ThemeColors.bordertextfromfiled,
                                    ),
                                  ),
                                  // enabledBorder: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.circular(25.0),
                                  //   borderSide: const BorderSide(
                                  //     color: Colors.black,
                                  //     width: 1.5,
                                  //   ),
                                  // ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 1.5,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your number';
                                  }
                                  if (RegExp(
                                          r"[!@#<>?':_`~ N؛،؟.,/;[\]\\|=+)(*&-]")
                                      .hasMatch(value)) {
                                    return 'Wrong number';
                                  }
                                  if (value.length > 10 || value.length < 10) {
                                    return 'Invalid number';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightscreen * 0.03),
                        Container(
                          height: 70,
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromARGB(180, 205, 171, 221),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'My balance :',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  //'${model.data!.user!.balance.toString()}+ \$',
                                  '',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: heightscreen * 0.03),
                        Container(
                          height: 50,
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: const RadialGradient(radius: 4, colors: [
                              Color.fromARGB(255, 141, 68, 243),
                              Colors.purple
                            ]),
                            border: Border.all(
                              color: const Color.fromARGB(255, 163, 33, 243),
                            ),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              // highlightColor: Colors.orange.withOpacity(0.3),
                              splashColor: ThemeColors.splashinkweel,
                              borderRadius: BorderRadius.circular(30),
                              onTap: () {
                                signOut(context);
                              },
                              child: const Center(
                                  child: Text(
                                'Log out',
                                style: TextStyle(
                                  color: ThemeColors.backgroundColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                            ),
                          ),
                        ),
                        SizedBox(height: heightscreen * 0.04),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
