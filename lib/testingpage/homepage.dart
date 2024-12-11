import 'package:flutter/material.dart';
import 'package:hotel_booking_app/testingpage/home_page.dart';

import 'home_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Breakfast',
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
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
        [
          Container(
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
                height: 150,
                color: Colors.green,
                child: ListView.builder(
                  itemBuilder: (context, index){
                    return Container();
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