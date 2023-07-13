import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todquest_active_user_app_flutter/constants/constants.dart';


class UiTaskScreen extends StatelessWidget {
  const UiTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[ 
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.white,
                Color.fromARGB(255, 193, 170, 240)
                
              ])
            ),
          ),
          
          
          Positioned(
            
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: Utilities.screenHeight * 0.1,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: Utilities.screenWidth * 0.05,
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(left: Utilities.screenWidth * 0.1),
                            width: Utilities.screenWidth * 0.8,
                            height: Utilities.screenHeight * 0.6,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment(0.8, 1),
                                  colors: <Color>[
                                    Color(0xffea8385),
                                    Color(0xffef9c90),
                                    Color(0xfff5b29a),
                                  ],
                                  tileMode: TileMode.mirror,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(180),
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25),
                                )),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: Utilities.screenHeight * 0.13,
                                  ),
                                   Text(
                                    "Breakfast",
                                    style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 60,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:  [
                                      Text(
                                        "Bread,",
                                        style: GoogleFonts.lato(
                                          color: Colors.white,
                                          fontSize: 30,
                                        ),
                                      ),
                                      Text(
                                        "Peanut butter,",
                                        style: GoogleFonts.lato(
                                          color: Colors.white,
                                          fontSize: 30,
                                        ),
                                      ),
                                      Text(
                                        "Apple",
                                        style: GoogleFonts.lato(
                                          color: Colors.white,
                                          fontSize: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(),
                                  Row(
                                    children: [
                                       Text(
                                        "525",
                                        style: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontSize: 60,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: Utilities.screenWidth * 0.05,
                                      ),
                                       Text(
                                        "kcal",
                                        style: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: Utilities.screenHeight * 0.15,
                        backgroundColor: Colors.white.withOpacity(0.2),
                        child:
                            const Image(image: AssetImage('assets/images/egg.png')),
                      )
                    ],
                  ),
                ],
              ),
            ],
                  ),
          )
      ]),
    );
  }
}