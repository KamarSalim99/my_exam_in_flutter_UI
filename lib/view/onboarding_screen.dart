import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
             SizedBox(
              height: 100,
               child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back_ios,color: Color(0xFFE4E4E4D4),),
                      SizedBox(width: 50,),
                      Text("Invite Friends",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800,color: Color(0xFFE4E4E4D4)),),
                      SizedBox(width: 50,),
                      Icon(Icons.delete,color: Color(0xFFE4E4E4D4)),
                    ],
                  ),
             ),
               Image.asset(
                "assets/images/Artwork.jpg",
              ),
            Text(
              "Invite Friends",
              style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800,color: Color(0xFFE4E4E4D4)),
            ),
            SizedBox(height: 20,),
            Text(
              "Sign up a friend with your referral\ncode and earn RIIDE and/or free rides.",
              style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800,color: Color(0xFFE4E4E4D4)),
            ),          SizedBox(height: 20,),
        
            InkWell(
              child: Container(
                  width: 324,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF161616),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Text("Share your invite code",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w400),),)
                ),
                          SizedBox(height: 2,),
        
            InkWell(
              child: Container(
                  width: 324,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF4CE5B1),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Text("Invite Friends",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600),),)
                ),
            ]),
      ));
  }
}