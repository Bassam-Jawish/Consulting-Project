
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:consulting_app/Bloc/consulting_cubit.dart';
import 'package:consulting_app/Bloc/consulting_state.dart';
import 'package:consulting_app/UI/Screens/home.dart';
import 'package:consulting_app/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double heightscreen = MediaQuery.of(context).size.height;
    double widthscreen = MediaQuery.of(context).size.width;

    return BlocConsumer<ConsultingCubit, ConsultingStates>(
  listener: (context, state) {},
  builder: (context, state) {
    return ConditionalBuilder(
      condition: state is! LoadingGetFavoritesState,
      builder:(context)=> Scaffold(
        appBar: null,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Your favorites',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 35,)),
                    ],
                  ),
                  SizedBox(height: heightscreen*0.05,),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: expertsList.length,
                      /*            itemCount: ConsultingCubit.get(context).favoriteModel!.data!.data!.length,*/
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                            height: heightscreen*0.02,
                          ),

                      itemBuilder: (context, index) => buildExpertCard(expertsList[index].id,expertsList[index].rate.toString() ,expertsList[index].name, expertsList[index].type, expertsList[index].price.toString(), expertsList[index].image, expertsList[index].inFavorites)


                    /*itemBuilder: (context, index) => buildListProduct(
                ShopCubit.get(context)
                  .favoriteModel!
                  .data!
                  .data![index]
                  .product!,
                context),*/
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      fallback: (context)=>Center(child: CircularProgressIndicator(),),
    );
  },
);
  }
}

Widget buildExpertCard(int id, String rate, String name, String type,String price, String image, bool inFavorites){
  return Container(
    padding: EdgeInsets.all(12),
    height: 140,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          offset: Offset(0,3),
          color: Colors.purple.withOpacity(0.3),
          blurRadius: 5,
        )
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 105,
          width: 110,
          decoration: BoxDecoration(
              border: Border.all(
                  width: 0.5,
                  color: Colors.deepPurple
              ),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(image),
              )
          ),
        ),
        SizedBox(width: 25,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(rate,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),)
                  ,SizedBox(width: 4,),
                  Icon(Icons.star,color: Colors.yellow,size: 12,),

                ],
              ),
              SizedBox(height: 10,),
              Text(name,style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w700),maxLines: 1,
                overflow: TextOverflow.ellipsis,),
              SizedBox(height: 10,),
              Text('Type: '+ type,style: TextStyle(color: Colors.deepPurple,fontSize: 14,fontWeight: FontWeight.w600),maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              SizedBox(height: 10,),
              Text("$price\$",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w700),),

            ],
          ),
        ),
        SizedBox(width: 20,),
        Column(
          children: [
            LikeButton(
              size: 25,
            ),
            SizedBox(height: 50,),
            Icon(Icons.chevron_right_outlined)
          ],
        )
      ],
    ),
  );
}
/*
Widget buildExpertCard(ExpertModel model, context) {
    return Container(
      padding: EdgeInsets.all(12),
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            color: Colors.purple.withOpacity(0.3),
            blurRadius: 5,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 105,
            width: 110,
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: Image.file(model.image!) as ImageProvider,
                )),
          ),
          SizedBox(
            width: 25,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      model.rate,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 12,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '$model.name',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Type: ' + '$model.type',
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "$model.price\$",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            children: [
              LikeButton(
                onTap: (isLiked) async{
                  print('x');
                  ConsultingCubit.get(context).changeFavorites(model.id!);
                },
                size: 25,
              ),
              SizedBox(
                height: 50,
              ),
              Icon(Icons.chevron_right_outlined)
            ],
          )
        ],
      ),
    );


  }*/

