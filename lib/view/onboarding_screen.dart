import 'package:exam2_at_flutterui/view/login_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color:Colors.black,
          child: Container(
            width: 375,
            height: 812,
                decoration: BoxDecoration(
              image: DecorationImage(image: Image.network("assets/images/map.png").image)
            ),
                child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
           SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  alignment: Alignment.center,
                  width: 48,
                  height: 48,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFF0E0E0E)
                  ),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFFE4E4E4D4),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  "Invite Friends",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFFE4E4E4D4)),
                ),
                SizedBox(
                  width: 50,
                ),
               Container(
                                margin: EdgeInsets.only(right: 10),
          
                  alignment: Alignment.center,
                  width: 48,
                  height: 48,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFF0E0E0E)
                  ),
                  child: Icon(
                    Icons.delete,
                    color: Color(0xFFE4E4E4D4),
                  ),
                ),
              ],
            ),
          ),
                
          Container(
            width:355 ,
            height:602 ,
            color: Colors.black,
            child: Column(children: [
                Container(
                  width:375 ,
                  height:326 ,
                  child: Image.asset(
                              "assets/images/Artwork.jpg",
                            ),
                ),
          const Text(
            "Invite Friends",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Color(0xFFE4E4E4D4)),
          ),
          const SizedBox(
            height: 2,
          ),
          const Text(
            "Sign up a friend with your referral\ncode and earn RIIDE and/or free rides.",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Color(0xFFE4E4E4D4)),
          ),
          const SizedBox(
            height: 2,
          ),
          InkWell(
              onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>LogInScreen()));
            },
              child: Container(
            width: 324,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color(0xFF161616),
                borderRadius: BorderRadius.circular(15)),
            child: const Text(
              "Share your invite code",
              style: TextStyle(
                  color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
            ),
          )),
          const SizedBox(
            height: 1,
          ),
          InkWell(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>LogInScreen()));
            },
              child: Container(
            width: 324,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color(0xFF4CE5B1),
                borderRadius: BorderRadius.circular(15)),
            child: const Text(
              "Invite Friends",
              style:  TextStyle(
                  color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
            ),
          )),],))
                ]),
              ),
        ));
  }
}
