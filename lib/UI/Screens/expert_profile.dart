//ExpertProfileScreen
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:consulting_app/Bloc/consulting_cubit.dart';
import 'package:consulting_app/Bloc/consulting_state.dart';
import 'package:consulting_app/Bloc/register/register_cubit.dart';
import 'package:consulting_app/Bloc/register/register_state.dart';
import 'package:consulting_app/UI/Components/constants.dart';
import 'package:consulting_app/UI/Screens/user_profile.dart';
import 'package:consulting_app/network/local/cash_helper.dart';
import 'package:consulting_app/theme/theme.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../Components/components.dart';
import 'expertRegister_screen.dart';

var emailController = TextEditingController();
var numberController = TextEditingController();
var roleController = TextEditingController();
var fullnameController = TextEditingController();

var medicineController = TextEditingController();
var careerController = TextEditingController();
var psychologyController = TextEditingController();
var familyController = TextEditingController();
var managementController = TextEditingController();
var descriptionController = TextEditingController();
var starttimeController = TextEditingController();
var endtimeController = TextEditingController();
var countryController = TextEditingController();
var cityController = TextEditingController();
List<TextEditingController> OthersNameController = [];
List<TextEditingController> OthersIdController = [];
List<TextEditingController> OthersProceController = [];

var formKey = GlobalKey<FormState>();

class ExpertProfileScreen extends StatefulWidget {
  const ExpertProfileScreen({super.key});

  @override
  State<ExpertProfileScreen> createState() => _ExpertProfileScreenState();
}

class _ExpertProfileScreenState extends State<ExpertProfileScreen> {
  int countcategory = 0;
  int counttime = 1;
  final bool istrue = true;

  final bool? isMedecine = false;
  final bool? isCareer = false;
  final bool? isPsychology = false;
  final bool? isFamily = false;
  final bool? isManagement = false;

//days
  final bool? isSunday = true;
  final bool? isMonday = false;
  final bool? isTuesday = false;
  final bool? isWednesday = false;
  final bool? isThursday = false;
  final bool? isFriday = false;
  final bool? isSaturday = false;

  List<String> name = [];
  List<String> price = [];
  List<dynamic> startTime = [];
  List<dynamic> endTime = [];

  int point = 0;

  void addListsTime() {
    for (int i = point; i < startTime.length; i++) {
      RegisterCubit.get(context).addTimes(startTime[i], endTime[i]);
    }
    point = startTime.length;
  }

  @override
  Widget build(BuildContext context) {
    double heightscreen = MediaQuery.of(context).size.height;
    double widthscreen = MediaQuery.of(context).size.width;
    return BlocConsumer<ConsultingCubit, ConsultingStates>(
      listener: (context, state) {},
      builder: (
        context,
        state,
      ) {
        var model = ConsultingCubit.get(context).userDataModel;
        var rate = 5;
        //fullnameController.text = model!.data!.user!.name!;
        // emailController.text = model.data!.user!.email!.toString();
        // numberController.text = model.data!.user!.phone!.toString();
        // if (model.data!.user!.isExp == 1)
        //   roleController.text = 'Expert';
        // else
        //   roleController.text = 'User';
        // countryController.text =
        //     model.data!.expert!.expertInfo!.country!.toString();
        // cityController.text = model.data!.expert!.expertInfo!.city!.toString();
        // descriptionController.text =
        //     model.data!.expert!.expertInfo!.skills!.toString();

        // final bool? isSunday = model.data!.expert!.days!.sunday!;
        // final bool? isMonday = model.data!.expert!.days!.monday!;
        // final bool? isTuesday = model.data!.expert!.days!.tuesday!;
        // final bool? isWednesday = model.data!.expert!.days!.wednesday!;
        // final bool? isThursday = model.data!.expert!.days!.thursday!;
        // final bool? isFriday = model.data!.expert!.days!.friday!;
        // final bool? isSaturday = model.data!.expert!.days!.saturday!;

        // medicineController.text =
        //     model!.data!.expert!.experiences![1].price.toString();
        // careerController.text =
        //     model.data!.expert!.experiences![2].price.toString();
        // psychologyController.text =
        //     model.data!.expert!.experiences![3].price.toString();
        // familyController.text =
        //     model.data!.expert!.experiences![4].price.toString();
        // managementController.text =
        //     model.data!.expert!.experiences![5].price.toString();

//         for (int i = 0; i < model!.data!.expert!.experiences!.length;i++) {
//  OthersNameController[i].text=model.data!.expert!.experiences![i].category_name;
//         }

        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: ThemeColors.icons),
            backgroundColor: Color.fromARGB(255, 205, 171, 221),
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
                  child: Stack(alignment: Alignment.bottomRight, children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${rate}',
                          //'${model.data.expert.expertInfo.rate}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.star_rate,
                          color: Colors.amber,
                          size: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 65.0,
                                    backgroundColor:
                                        Color.fromARGB(255, 200, 119, 238),
                                  ),
                                  Container(
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius:
                                            BorderRadius.circular(100),
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
                        ),
                      ],
                    ),
                  ]),
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
                              'My Role:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: ThemeColors.icon,
                              ),
                            ),
                            SizedBox(
                              width: 29,
                            ),
                            Container(
                              height: 50,
                              width: 250,
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
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: heightscreen * 0.02,
                        ),
                        Row(
                          children: [
                            Text(
                              'My Name:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: ThemeColors.icon,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 50,
                              width: 250,
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
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: heightscreen * 0.02,
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
                              width: 22,
                            ),
                            Container(
                              height: 50,
                              width: 250,
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
                          height: heightscreen * 0.02,
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
                            Container(
                              height: 50,
                              width: 250,
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
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightscreen * 0.04),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                'My services',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  backgroundColor:
                                      Color.fromARGB(50, 105, 22, 135),
                                  // backgroundColor: Color.fromARGB(
                                  //   100,
                                  //   172,
                                  //   122,
                                  //   183,
                                  // ),
                                  // color: Color.fromARGB(255, 172, 122, 183),
                                ),
                              ),
                            ]),
                        SizedBox(
                          height: heightscreen * 0.03,
                        ),
                        Column(
                          children: [
                            Container(
                              color: ThemeColors.backgroundColor,
                              child: CheckboxListTile(
                                activeColor: Colors.deepPurple,

                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Medicene',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        color:
                                            Color.fromARGB(255, 105, 22, 135),
                                        //backgroundColor: Color.fromARGB(80, 172, 122, 183),
                                      ),
                                    ),
                                    TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      controller: medicineController,
                                      enabled: false,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        labelStyle: TextStyle(
                                          color: ThemeColors.highlight,
                                        ),
                                        fillColor: Colors.white,
                                        focusColor: Colors.white,
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                ThemeColors.bordertextfromfiled,
                                          ),
                                        ),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1.5,
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 1.5,
                                          ),
                                        ),
                                        labelText: 'price',
                                        prefixIcon: Icon(
                                          Icons.price_change_outlined,
                                          color: ThemeColors.icon,
                                        ),
                                        suffixStyle:
                                            TextStyle(color: Colors.grey),
                                        suffixText: '\$',
                                      ),
                                    ),
                                  ],
                                ),

                                value: isMedecine,
                                onChanged: (newbool) {
                                  setState(() {});
                                },
                                // activeColor: Color.fromARGB(255, 80, 185, 166),
                                // checkColor: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: heightscreen * 0.01,
                            ),
                            Container(
                              color: ThemeColors.backgroundColor,
                              child: CheckboxListTile(
                                activeColor: Colors.deepPurple,

                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Career',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        color:
                                            Color.fromARGB(255, 105, 22, 135),
                                      ),
                                    ),
                                    TextFormField(
                                      enabled: false,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      controller: careerController,
                                      keyboardType: TextInputType.number,
                                      cursorColor: ThemeColors.highlight,
                                      decoration: const InputDecoration(
                                        labelStyle: TextStyle(
                                          color: ThemeColors.highlight,
                                        ),
                                        fillColor: Colors.white,
                                        focusColor: Colors.white,
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                ThemeColors.bordertextfromfiled,
                                          ),
                                        ),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1.5,
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 1.5,
                                          ),
                                        ),
                                        labelText: 'price',
                                        prefixIcon: Icon(
                                          Icons.price_change_outlined,
                                          color: ThemeColors.icon,
                                        ),
                                        suffixStyle:
                                            TextStyle(color: Colors.grey),
                                        suffixText: "\$",
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty &&
                                            isCareer == true) {
                                          return 'Enter price';
                                        }
                                        return null;
                                      },
                                      onFieldSubmitted: (value) {},
                                    ),
                                  ],
                                ),
                                value: isCareer,
                                onChanged: (newbool) {
                                  setState(() {});
                                },
                                // activeColor: Color.fromARGB(255, 80, 185, 166),
                                // checkColor: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: heightscreen * 0.01,
                            ),
                            Container(
                              color: ThemeColors.backgroundColor,
                              child: CheckboxListTile(
                                activeColor: Colors.deepPurple,

                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Psychology',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        color:
                                            Color.fromARGB(255, 105, 22, 135),
                                      ),
                                    ),
                                    TextFormField(
                                      enabled: false,
                                      cursorColor: ThemeColors.highlight,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      controller: psychologyController,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        labelStyle: TextStyle(
                                          color: ThemeColors.highlight,
                                        ),
                                        fillColor: Colors.white,
                                        focusColor: Colors.white,
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                ThemeColors.bordertextfromfiled,
                                          ),
                                        ),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1.5,
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 1.5,
                                          ),
                                        ),
                                        labelText: 'price',
                                        prefixIcon: Icon(
                                          Icons.price_change_outlined,
                                          color: ThemeColors.icon,
                                        ),
                                        suffixStyle:
                                            TextStyle(color: Colors.grey),
                                        suffixText: "\$",
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty &&
                                            isPsychology == true) {
                                          return 'Enter price';
                                        }
                                        return null;
                                      },
                                      onFieldSubmitted: (value) {},
                                    ),
                                  ],
                                ),
                                value: isPsychology,
                                onChanged: (newbool) {},
                                // activeColor: Color.fromARGB(255, 80, 185, 166),
                                // checkColor: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: heightscreen * 0.01,
                            ),
                            Container(
                              color: ThemeColors.backgroundColor,
                              child: CheckboxListTile(
                                activeColor: Colors.deepPurple,

                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Family',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        color:
                                            Color.fromARGB(255, 105, 22, 135),
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    TextFormField(
                                      cursorColor: ThemeColors.highlight,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      onFieldSubmitted: (value) {},
                                      controller: familyController,
                                      keyboardType: TextInputType.number,
                                      enabled: isFamily,
                                      decoration: const InputDecoration(
                                        labelStyle: TextStyle(
                                          color: ThemeColors.highlight,
                                        ),
                                        fillColor: Colors.white,
                                        focusColor: Colors.white,
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                ThemeColors.bordertextfromfiled,
                                          ),
                                        ),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1.5,
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 1.5,
                                          ),
                                        ),
                                        labelText: 'price',
                                        prefixIcon: Icon(
                                          Icons.price_change_outlined,
                                          color: ThemeColors.icon,
                                        ),
                                        suffixStyle:
                                            TextStyle(color: Colors.grey),
                                        suffixText: "\$",
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty &&
                                            isFamily == true) {
                                          return 'Enter price';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                                value: isFamily,
                                onChanged: (newbool) {
                                  setState(() {});
                                },
                                // activeColor: Color.fromARGB(255, 80, 185, 166),
                                // checkColor: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: heightscreen * 0.01,
                            ),
                            Container(
                              color: ThemeColors.backgroundColor,
                              child: CheckboxListTile(
                                activeColor: Colors.deepPurple,
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Management',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        color:
                                            Color.fromARGB(255, 105, 22, 135),
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    TextFormField(
                                      enabled: false,
                                      cursorColor: ThemeColors.highlight,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      controller: managementController,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        labelStyle: TextStyle(
                                          color: ThemeColors.highlight,
                                        ),
                                        fillColor: Colors.white,
                                        focusColor: Colors.white,
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                ThemeColors.bordertextfromfiled,
                                          ),
                                        ),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1.5,
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 1.5,
                                          ),
                                        ),
                                        labelText: 'price',
                                        prefixIcon: Icon(
                                          Icons.price_change_outlined,
                                          color: ThemeColors.icon,
                                        ),
                                        suffixStyle:
                                            TextStyle(color: Colors.grey),
                                        suffixText: "\$",
                                      ),
                                    ),
                                  ],
                                ),
                                value: isManagement,
                                onChanged: (newbool) {
                                  setState(() {});
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              reverse: true,
                              itemCount: countcategory,
                              itemBuilder: (context, index) => addCatergory(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  'MY Address',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    backgroundColor:
                                        Color.fromARGB(50, 105, 22, 135),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: heightscreen * 0.02,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: TextFormField(
                                  enabled: false,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: countryController,
                                  keyboardType: TextInputType.text,
                                  onFieldSubmitted: (String value) {
                                    print(value);
                                  },
                                  decoration: const InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.place_outlined,
                                      color: Colors.deepPurple,
                                    ),
                                    labelStyle: TextStyle(
                                      color: ThemeColors.highlight,
                                    ),
                                    fillColor: Colors.white,
                                    focusColor: Colors.white,
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: ThemeColors.bordertextfromfiled,
                                      ),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 1.5,
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 1.5,
                                      ),
                                    ),
                                    labelText: 'country',
                                  ),
                                )),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                    child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: cityController,
                                  enabled: false,
                                  keyboardType: TextInputType.text,
                                  onFieldSubmitted: (String value) {
                                    print(value);
                                  },
                                  decoration: const InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.place_outlined,
                                      color: Colors.deepPurple,
                                    ),
                                    labelStyle: TextStyle(
                                      color: ThemeColors.highlight,
                                    ),
                                    fillColor: Colors.white,
                                    focusColor: Colors.white,
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: ThemeColors.bordertextfromfiled,
                                      ),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 1.5,
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 1.5,
                                      ),
                                    ),
                                    labelText: 'city',
                                  ),
                                )),
                              ],
                            ),
                            SizedBox(
                              height: heightscreen * 0.04,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  'My Experience',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    backgroundColor:
                                        Color.fromARGB(50, 105, 22, 135),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: heightscreen * 0.02,
                            ),
                            TextFormField(
                              enabled: false,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: descriptionController,
                              maxLines: 3,
                              keyboardType: TextInputType.multiline,
                              // minLines: null,
                              decoration: InputDecoration(
                                labelText: "Description",
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
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 1.5,
                                  ),
                                ),
                              ),
                              cursorColor: ThemeColors.highlight,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Write your experience';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: heightscreen * 0.04,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  'My Scheduale',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    backgroundColor:
                                        Color.fromARGB(50, 105, 22, 135),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: heightscreen * 0.03,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Column(children: [
                                    const Text('Sunday'),
                                    Checkbox(
                                      activeColor: Colors.deepPurple,
                                      value: isSunday,
                                      onChanged: (newbool) {},
                                    ),
                                    // Checkbox(value: value, onChanged: onChanged)
                                  ]),
                                  SizedBox(
                                    width: widthscreen * 0.05,
                                  ),
                                  Column(children: [
                                    const Text('Monday'),
                                    Checkbox(
                                      activeColor: Colors.deepPurple,
                                      value: isMonday,
                                      onChanged: (newbool) {},
                                    ),
                                    // Checkbox(value: value, onChanged: onChanged)
                                  ]),
                                  SizedBox(
                                    width: widthscreen * 0.05,
                                  ),
                                  Column(children: [
                                    const Text('Tuesday'),
                                    Checkbox(
                                      activeColor: Colors.deepPurple,
                                      value: isTuesday,
                                      onChanged: (newbool) {},
                                    ),
                                    // Checkbox(value: value, onChanged: onChanged)
                                  ]),
                                  SizedBox(
                                    width: widthscreen * 0.05,
                                  ),
                                  Column(children: [
                                    const Text('Wednesday'),
                                    Checkbox(
                                      activeColor: Colors.deepPurple,
                                      value: isWednesday,
                                      onChanged: (newbool) {},
                                    ),
                                    // Checkbox(value: value, onChanged: onChanged)
                                  ]),
                                  SizedBox(
                                    width: widthscreen * 0.05,
                                  ),
                                  Column(children: [
                                    const Text('Thursday'),
                                    Checkbox(
                                      activeColor: Colors.deepPurple,
                                      value: isThursday,
                                      onChanged: (newbool) {},
                                    ),
                                    // Checkbox(value: value, onChanged: onChanged)
                                  ]),
                                  SizedBox(
                                    width: widthscreen * 0.05,
                                  ),
                                  Column(children: [
                                    const Text('Friday'),
                                    Checkbox(
                                      activeColor: Colors.deepPurple,
                                      value: isFriday,
                                      onChanged: (newbool) {},
                                    ),
                                    // Checkbox(value: value, onChanged: onChanged)
                                  ]),
                                  SizedBox(
                                    width: widthscreen * 0.05,
                                  ),
                                  Column(children: [
                                    const Text('Saturday'),
                                    Checkbox(
                                      activeColor: Colors.deepPurple,
                                      value: isSaturday,
                                      onChanged: (newbool) {},
                                    ),

                                    // Checkbox(value: value, onChanged: onChanged)
                                  ]),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: heightscreen * 0.02,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          //reverse: true,
                          itemCount: counttime,
                          itemBuilder: (context, j) => Addtime(j),
                        ),
                        SizedBox(
                          height: heightscreen * 0.02,
                        ),
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
                          height: 60,
                          width: 140,
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
                              onTap: () {},
                              child: const Center(
                                  child: Text(
                                'Reservation history',
                                style: TextStyle(
                                  color: ThemeColors.backgroundColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800,
                                ),
                              )),
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
                        // IconButton(
                        //     onPressed: () => Navigator.of(context)
                        //         .pushReplacementNamed('/expertRegister'),
                        //     icon: Icon(Icons.add)),
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

  Widget addCatergory() {
    return Column(
      children: [
        TextFormField(
          enabled: false,
          cursorColor: ThemeColors.highlight,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            labelStyle: TextStyle(
              color: ThemeColors.highlight,
            ),
            fillColor: Colors.white,
            focusColor: Colors.white,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ThemeColors.bordertextfromfiled,
              ),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.5,
              ),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.5,
              ),
            ),
            labelText: 'My consultation',
            prefixIcon: Icon(
              Icons.work_outline,
              color: ThemeColors.icon,
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your consultation';
            }
            return null;
          },
          onFieldSubmitted: (value) {
            setState(() {});
          },
        ),
        TextFormField(
          enabled: false,
          cursorColor: ThemeColors.highlight,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            suffixStyle: TextStyle(color: Colors.grey),
            suffixText: "\$",
            labelStyle: TextStyle(
              color: ThemeColors.highlight,
            ),
            fillColor: Colors.white,
            focusColor: Colors.white,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ThemeColors.bordertextfromfiled,
              ),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.5,
              ),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.5,
              ),
            ),
            labelText: 'price',
            prefixIcon: Icon(
              Icons.price_change_outlined,
              color: ThemeColors.icon,
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter price';
            }
            return null;
          },
          onFieldSubmitted: (value) {
            setState(() {});
          },
        ),
      ],
    );
  }

  Widget Addtime(int index) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 50,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  suffixStyle:
                      const TextStyle(color: Colors.grey, fontSize: 16),
                  suffixText: ":00",
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1.5,
                    ),
                  ),
                ),
                cursorColor: ThemeColors.highlight,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "It's empty!";
                  }
                  if (int.parse(value) < 0 || int.parse(value) > 22) {
                    return 'Invalid start time';
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  setState(() {
                    startTime.add(int.parse(value));
                    if (counttime == startTime.length &&
                        counttime == endTime.length) {
                      addListsTime();
                    }
                  });
                },
                onTap: () {
                  RegisterCubit.get(context).addDays(isSunday, isMonday,
                      isTuesday, isWednesday, isThursday, isFriday, isSaturday);
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
                width: 120,
                height: 50,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    suffixStyle:
                        const TextStyle(color: Colors.grey, fontSize: 16),
                    suffixText: ":00",
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
                  cursorColor: ThemeColors.highlight,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "It's empty!";
                    }
                    if (int.parse(value) < 1 || int.parse(value) > 23) {
                      return 'Invalid end time';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    setState(() {
                      endTime.add(int.parse(value));
                      if (counttime == startTime.length &&
                          counttime == endTime.length) {
                        addListsTime();
                      }
                    });
                  },
                )),
            // const SizedBox(
            //   width: 10,
            // ),
            // index == 0
            // ? Row(
            //     children: [
            //       Container(
            //         height: 25,
            //         width: 40,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(50),
            //           gradient: const RadialGradient(radius: 4, colors: [
            //             Color.fromARGB(255, 141, 68, 243),
            //             Colors.purple
            //           ]),
            //           border: Border.all(
            //             color: const Color.fromARGB(255, 163, 33, 243),
            //           ),
            //         ),
            //         child: Material(
            //           color: Colors.transparent,
            //           child: InkWell(
            //             // highlightColor: Colors.orange.withOpacity(0.3),
            //             splashColor: ThemeColors.splashinkweel,
            //             borderRadius: BorderRadius.circular(30),
            //             onTap: () {
            //               setState(() {
            //                 counttime++;
            //               });
            //             },
            //             child: const Center(
            //               child: Icon(Icons.add),
            //             ),
            //           ),
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 20,
            //       ),
            //       Container(
            //         height: 25,
            //         width: 40,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(50),
            //           gradient: const RadialGradient(radius: 4, colors: [
            //             Color.fromARGB(255, 141, 68, 243),
            //             Colors.purple
            //           ]),
            //           border: Border.all(
            //             color: const Color.fromARGB(255, 163, 33, 243),
            //           ),
            //         ),
            //         child: Material(
            //           color: Colors.transparent,
            //           child: InkWell(
            //             // highlightColor: Colors.orange.withOpacity(0.3),
            //             splashColor: ThemeColors.splashinkweel,
            //             borderRadius: BorderRadius.circular(30),
            //             onTap: () {
            //               setState(() {
            //                 if (counttime > 0) {
            //                   if (counttime == startTime.length &&
            //                       counttime == endTime.length) {
            //                     setState(() {
            //                       startTime.removeLast();
            //                       endTime.removeLast();
            //                       RegisterCubit.get(context).deleteTimes();
            //                     });
            //                   } else if (counttime == startTime.length) {
            //                     setState(() {
            //                       name.removeLast();
            //                     });
            //                   } else if (counttime == endTime.length) {
            //                     setState(() {
            //                       price.removeLast();
            //                     });
            //                   }
            //                   setState(() {
            //                     counttime--;
            //                   });
            //                 }
            //               });
            //             },
            //             child: const Center(
            //                 child: Text(
            //               '-',
            //               style: TextStyle(
            //                 fontSize: 22,
            //                 //fontWeight: FontWeight.bold,
            //               ),
            //             )),
            //           ),
            //         ),
            //       ),
            //     ],
            //   )
            // : Container(),
          ],
        ),
      ],
    );
  }
}
