import 'package:flutter/material.dart';
import 'package:hotel_booking_app/models/category_model.dart';
import 'package:hotel_booking_app/models/second_model.dart';

import 'home_page.dart';

class Home extends StatelessWidget {
  Home({super.key});

  List<CategoryModel> categories = [];
  List<secondModel> second = [];

  void _getInitialInfo(){
    categories = CategoryModel.getCategories();
    second = secondModel.getSecond();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Generation',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()), // Replace with your homepage.
            );
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            child: Icon(Icons.arrow_back_ios_new,
            size: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.circular(10)
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {

            },
            child: Container(
              alignment: Alignment.center,
              width: 37,
              margin: EdgeInsets.all(10),
              child: Icon(Icons.menu,
                size: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children:
        [Container(
            margin: EdgeInsets.only(top: 40,left: 20,right: 20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.11),
                  blurRadius: 40,
                  spreadRadius: 0.0
                )
              ]
            ),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(15),
                hintText: 'Search Food',
                hintStyle: TextStyle(
                  color: Color(0xffDDDADA),
                  fontSize: 16
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(Icons.search),
                ),
                suffixIcon: Container(
                  width: 100,
                  //color: Colors.blue,
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        VerticalDivider(
                          color: Colors.black,
                          indent: 10,
                          endIndent: 10,
                          thickness: 0.2,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Icon(Icons.tune),
                        ),
                      ],
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none
                )
              ),
            ),
          ),
         SizedBox(height: 40,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Padding(
               padding: const EdgeInsets.only(left: 20),
               child: Text(
                 'Category',
                 style: TextStyle(
                   color: Colors.black,
                   fontSize: 18,
                   fontWeight: FontWeight.w600
                 ),
               ),
             ),
             SizedBox(height: 15,),
             Container(
               height: 120,
               //color: Colors.green,
               child: ListView.separated(
                 itemCount: categories.length,
                 scrollDirection: Axis.horizontal,
                 padding: EdgeInsets.only(
                   left: 20,
                   right: 20,
                 ),
                 separatorBuilder: (context, index) => SizedBox(width: 25,),
                 itemBuilder: (context, index){
                   return Container(
                     width: 100,
                     decoration: BoxDecoration(
                       color: categories[index].boxColor.withOpacity(0.3),
                       borderRadius: BorderRadius.circular(16)
                     ),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Container(
                           width:50,
                           height: 50,
                           decoration: BoxDecoration(
                             color: Colors.white,
                             shape: BoxShape.circle
                           ),
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child:  Image.asset(categories[index].iconPath),
                           ),
                         ),
                         SizedBox(height: 5,),
                         Text(categories[index].name,
                           style: TextStyle(
                             fontWeight: FontWeight.w400,
                             color: Colors.black,
                             fontSize: 14
                           ),
                         ),
                         Text(categories[index].subText,
                           style: TextStyle(
                               fontWeight: FontWeight.w400,
                               color: Colors.black87,
                               fontSize: 12
                           ),
                         )
                       ],
                     ),
                   );
                 },
               ),
             ),
           ],
         ),
         SizedBox(height: 40,),
        ],
      ),
    );
  }
}
