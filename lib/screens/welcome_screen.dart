import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.only(top: 100, bottom: 40),
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
            opacity: 0.8,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Coffee Shop", style: GoogleFonts.playfairDisplay(
                fontSize: 62,
              color: Colors.white,
            ),
            ),
            Column(
              children: [
                Text("Feeling Low? Take Sip of Coffee",style: TextStyle(
                  fontSize: 20,
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
                ),
                SizedBox(height: 80,),
                Material(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(10),

                  child: InkWell(
                    splashColor: Colors.black,
                    onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen(),
                      ));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                      child:Text("Get Start",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}