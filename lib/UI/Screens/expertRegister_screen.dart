import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:consulting_app/Bloc/register/register_cubit.dart';
import 'package:consulting_app/Bloc/register/register_state.dart';
import 'package:consulting_app/UI/Components/constants.dart';
import 'package:consulting_app/network/local/cash_helper.dart';
import 'package:consulting_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../Components/components.dart';

var firstnameController = TextEditingController();
var lastnameController = TextEditingController();
var emailController = TextEditingController();
var passwordController = TextEditingController();
var confirmpasswordController = TextEditingController();
var numberController = TextEditingController();
var fullname = firstnameController.text + lastnameController.text;
var formKey = GlobalKey<FormState>();

class ExpertRegisterScreen extends StatefulWidget {
  const ExpertRegisterScreen({super.key});

  @override
  State<ExpertRegisterScreen> createState() => _ExpertRegisterScreenState();
}

class _ExpertRegisterScreenState extends State<ExpertRegisterScreen> {
  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException {
      print('Failed to pick image');
    }
  }

  @override
  Widget build(BuildContext context) {
    double heightscreen = MediaQuery.of(context).size.height;
    double widthscreen = MediaQuery.of(context).size.width;
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          if (state.loginModel.status!) {
            print(state.loginModel.message!);
            print(state.loginModel.data!.token);
            showToast(
              text: state.loginModel.message!,
              state: ToastState.success,
            );
            CacheHelper.saveData(
              key: 'token',
              value: state.loginModel.data!.token,
            ).then((value) {
              token = state.loginModel.data!.token;
              Navigator.of(context).pushReplacementNamed('/home');
            });
          } else {
            print(state.loginModel.message!);
            showToast(
              text: state.loginModel.message!,
              state: ToastState.error,
            );
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ThemeColors.backgroundColor,
          appBar: null,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Expanded(
                child: Column(
                  children: [
                    Container(
                      height: heightscreen,
                      width: widthscreen,
                      // color: ThemeColors.backgroundColor,
                      child: Column(children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              width: double.infinity,
                              // height: 100,
                              child: Image.asset(
                                "assets/images/image1.png",
                                fit: BoxFit.cover,
                                // height: 200,
                              ),
                            ),
                            Stack(
                              children: [
                                Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Container(
                                          child: image != null
                                              ? Container(
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      // splashColor: Colors.blue,
                                                      child: ClipOval(
                                                        child: Image.file(
                                                          image!,
                                                          width: 115,
                                                          height: 115,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      onTap: () => pickImage(
                                                          ImageSource.gallery),
                                                    ),
                                                  ),
                                                )
                                              : Container(
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      // splashColor: Colors.blue,
                                                      child: ClipOval(
                                                        child: Image.asset(
                                                          "assets/images/imageprofile.jpeg",
                                                          width: 115,
                                                          height: 115,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      onTap: () => pickImage(
                                                          ImageSource.gallery),
                                                    ),
                                                  ),
                                                )),
                                      IconButton(
                                        onPressed: () =>
                                            pickImage(ImageSource.gallery),
                                        icon: const CircleAvatar(
                                          radius: 30.0,
                                          backgroundColor: Colors.white,
                                          child: Icon(
                                            Icons.camera_alt_outlined,
                                            size: 30,
                                            color:
                                                Color.fromARGB(255, 67, 64, 64),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ],
                            ),
                          ],
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
                                    Expanded(
                                        child: TextFormField(
                                      controller: firstnameController,
                                      keyboardType: TextInputType.text,
                                      onFieldSubmitted: (String value) {
                                        print(value);
                                      },
                                      decoration: InputDecoration(
                                        labelText: "First Name",
                                        prefixIcon: const Icon(
                                          Icons.person,
                                          color: ThemeColors.icon,
                                        ),
                                        labelStyle: const TextStyle(
                                          color: ThemeColors.highlight,
                                        ),
                                        fillColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(35.0),
                                          borderSide: const BorderSide(
                                            color:
                                                ThemeColors.bordertextfromfiled,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: const BorderSide(
                                            color: Colors.black,
                                            width: 1.5,
                                          ),
                                        ),
                                      ),
                                    )),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                        child: TextFormField(
                                      controller: lastnameController,
                                      keyboardType: TextInputType.text,
                                      onFieldSubmitted: (String value) {
                                        print(value);
                                      },
                                      decoration: InputDecoration(
                                        labelText: "Last Name",
                                        prefixIcon: const Icon(
                                          Icons.person,
                                          color: ThemeColors.icon,
                                        ),
                                        labelStyle: const TextStyle(
                                          color: ThemeColors.highlight,
                                        ),
                                        fillColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(35.0),
                                          borderSide: const BorderSide(
                                            color:
                                                ThemeColors.bordertextfromfiled,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: const BorderSide(
                                              color: Colors.black, width: 1.5),
                                        ),
                                      ),
                                    )),
                                  ],
                                ),
                                SizedBox(
                                  height: heightscreen * 0.04,
                                ),
                                TextFormField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  onFieldSubmitted: (String value) {
                                    print(value);
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Enter Email",
                                    prefixIcon: const Icon(
                                      Icons.email,
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
                                  ),
                                ),
                                SizedBox(
                                  height: heightscreen * 0.04,
                                ),
                                TextFormField(
                                  obscureText:
                                      RegisterCubit.get(context).isPassword,
                                  controller: passwordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    labelText: ' password',
                                    labelStyle: const TextStyle(
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: ThemeColors.icon,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        RegisterCubit.get(context)
                                            .changePassVisibility();
                                      },
                                      icon: Icon(
                                        RegisterCubit.get(context).suffix,
                                        color: ThemeColors.icon,
                                      ),
                                    ),

                                    /*suffixIcon: IconButton(
                                        icon: Icon(
                                          _isObscure
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: ThemeColors.icon,
                                        ),
                                        onPressed: () {
                                          RegisterCubit.get(context).changePassVisibility();
              
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                        }),
                                        obscureText: _isObscure,
                                        */
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
                                  ),
                                ),
                                SizedBox(
                                  height: heightscreen * 0.04,
                                ),
                                TextFormField(
                                  obscureText:
                                      RegisterCubit.get(context).isPassword,
                                  controller: confirmpasswordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    labelText: ' confirm password',
                                    labelStyle: const TextStyle(
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: ThemeColors.icon,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        RegisterCubit.get(context)
                                            .changePassVisibility();
                                      },
                                      icon: Icon(
                                        RegisterCubit.get(context).suffix,
                                        color: ThemeColors.icon,
                                      ),
                                    ),

                                    /*suffixIcon: IconButton(
                                        icon: Icon(
                                          _isObscure
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: ThemeColors.icon,
                                        ),
                                        onPressed: () {
                                          RegisterCubit.get(context).changePassVisibility();
              
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                        }),
                                        obscureText: _isObscure,
                                        */
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
                                  ),
                                ),
                                SizedBox(
                                  height: heightscreen * 0.04,
                                ),
                                TextFormField(
                                  controller: numberController,
                                  keyboardType: TextInputType.phone,
                                  onFieldSubmitted: (String value) {
                                    print(value);
                                  },
                                  decoration: InputDecoration(
                                    labelText: "phone",
                                    prefixIcon: const Icon(
                                      Icons.phone,
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
                                  ),
                                ),
                                SizedBox(height: heightscreen * 0.04),
                                ConditionalBuilder(
                                  condition: state is! RegisterLoadingState,
                                  builder: (context) => Container(
                                    height: 50,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      gradient: RadialGradient(
                                          radius: 4,
                                          colors: [
                                            Color.fromARGB(255, 141, 68, 243),
                                            Colors.purple
                                          ]),
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 163, 33, 243),
                                      ),
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        splashColor: ThemeColors.splashinkweel,
                                        borderRadius: BorderRadius.circular(30),
                                        onTap: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            RegisterCubit.get(context)
                                                .userRegister(
                                              name: fullname,
                                              email: emailController.text,
                                              password: passwordController.text,
                                              phone: numberController.text,
                                            );
                                          }
                                        },
                                        child: const Center(
                                            child: Text(
                                          'Sign up',
                                          style: TextStyle(
                                            color: ThemeColors.backgroundColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                      ),
                                    ),
                                  ),
                                  fallback: (context) => const Center(
                                      child: CircularProgressIndicator()),
                                ),
                                SizedBox(height: heightscreen * 0.001),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text('Alrready have a account?'),
                                        MaterialButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushReplacementNamed('/login');
                                          },
                                          child: const Text(
                                            'Log in',
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: ThemeColors.highlight,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
