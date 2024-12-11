import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.blueAccent, // Background color for the main screen
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: [
                Container(
                  height: 800,
                  width: 500,
                  //color: Colors.red,
                  // This is the main background,
                  ),
                Positioned(
                  bottom: 0,
                  child: Center(
                    child: Container(
                      height: 345,
                      width: 500,
                      decoration: BoxDecoration(
                        //color: Colors.yellow,
                        image: const DecorationImage(
                          image: AssetImage('assets/images/BottomLayout.png'),
                          fit: BoxFit.cover, // Scales the image to cover the entire container
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: -260,
                  top: 50,
                  child: Container(
                    height: 545,
                    width: 545,
                    decoration: BoxDecoration(
                      //color:Colors.yellow,
                      image: const DecorationImage(
                        image: AssetImage('assets/images/RightSide.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 100,
                  right: 140,
                  child: Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                      //color: Colors.black
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 15),
                          ),
                        child: const Text(
                          "Get Start",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16),
                        ),
                    ),
                  ),
                ),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
