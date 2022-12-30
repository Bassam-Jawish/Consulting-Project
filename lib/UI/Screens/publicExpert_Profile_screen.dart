import 'package:consulting_app/Bloc/consulting_cubit.dart';
import 'package:consulting_app/Bloc/consulting_state.dart';
import 'package:consulting_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PublicExpertProfileScreen extends StatefulWidget {
  const PublicExpertProfileScreen({super.key});

  @override
  State<PublicExpertProfileScreen> createState() =>
      _PublicExpertProfileScreenState();
}

class _PublicExpertProfileScreenState extends State<PublicExpertProfileScreen> {
  double rating = 0;
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
        //var model = ConsultingCubit.get(context).;
        //var list = model!.data!.expert!.experiences!;
        return Scaffold(
          backgroundColor: ThemeColors.backgroundColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 3, left: 25, right: 25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.black,
                          icon: const Icon(
                            Icons.chevron_left,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(33),
                            color: Color.fromARGB(255, 200, 119, 238),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 0),
                                blurRadius: 2,
                                spreadRadius: 2,
                                color: Colors.black26,
                              ),
                            ],
                          ),
                          width: 155,
                          height: 185,
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(33),
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.asset(
                                'assets/demo/tech.png',
                                fit: BoxFit.cover,
                                width: 150,
                                height: 180,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'DR steaf hihihjjjdddd',
                                //'${model!.data!.user!.name!}',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13),
                                      color: Color.fromARGB(120, 206, 157, 223),
                                    ),
                                    child: Icon(
                                      Icons.phone,
                                      color: Color.fromARGB(255, 160, 7, 168),
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13),
                                      color: Color.fromARGB(120, 206, 157, 223),
                                    ),
                                    child: Icon(
                                      Icons.message,
                                      color: Color.fromARGB(255, 160, 7, 168),
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              RatingBar.builder(
                                itemSize: 25,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.purple,
                                ),
                                onRatingUpdate: (rating) => setState(() {
                                  this.rating = rating;
                                }),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: heightscreen * 0.03,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.info_outline,
                          size: 25,
                          color: Color.fromARGB(255, 158, 62, 202),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'About',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: heightscreen * 0.02,
                    ),
                    Text(
                      //'${model!.data!.expert!.expertInfo!.skills!}',
                      'gfdgdfgd fnfjrnfje rnfjeknfej wknfewk jnfjk ewnf cjkew nfj wekfnjkewnbfkejfbnjrkebfnejrhkfbnrejkbfnjrbrjhbr',
                      style: TextStyle(
                          color: Color.fromARGB(255, 59, 53, 66), fontSize: 18),
                    ),
                    SizedBox(
                      height: heightscreen * 0.04,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.work_outline_outlined,
                          size: 25,
                          color: Color.fromARGB(255, 158, 62, 202),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'services',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: heightscreen * 0.02,
                    ),

                    ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Serveses(
                            //list[index]
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                        itemCount: 3),
                    //model!.data!.expert!.experiences!.length),
                    SizedBox(
                      height: heightscreen * 0.03,
                    ),
                    Column(
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.place_outlined,
                              size: 25,
                              color: Color.fromARGB(255, 158, 62, 202),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Address',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              height: 10,
                              width: 36,
                            ),
                            Text(
                              //'${model.data!.expert!.expertInfo!.city!}' + ' , ' + '${model.data!.expert!.expertInfo!.country!}',
                              'damascus' + ' , ' + 'syria',
                              style: TextStyle(
                                color: Color.fromARGB(255, 53, 42, 70),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: heightscreen * 0.03,
                    ),
                    Column(
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.email_outlined,
                              size: 25,
                              color: Color.fromARGB(255, 158, 62, 202),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              height: 10,
                              width: 36,
                            ),
                            Text(
                              //'${model.data!.user!.email!}',
                              'batoul@gmail.com',
                              style: TextStyle(
                                color: Color.fromARGB(255, 53, 42, 70),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: heightscreen * 0.03,
                    ),
                    Column(
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.phone_android_outlined,
                              size: 25,
                              color: Color.fromARGB(255, 158, 62, 202),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Phone',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              height: 10,
                              width: 36,
                            ),
                            Text(
                              //'${model.data!.user!.phone}',
                              '09478989889',
                              style: TextStyle(
                                color: Color.fromARGB(255, 53, 42, 70),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
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
          ),
        );
      },
    );
  }

  Widget Serveses(/*article*/) => Row(
        children: [
          SizedBox(
            width: 35,
          ),
          Icon(
            Icons.circle,
            size: 10,
            color: Color.fromARGB(255, 110, 104, 104),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            //'${article['category_name']}',
            'Management',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color.fromARGB(255, 105, 22, 135),
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            width: 40,
          ),
          Text(
            //'${article['price']}'+' \$',
            '459 \$',
            style: TextStyle(
                color: Color.fromARGB(255, 105, 33, 116),
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
        ],
      );
}
