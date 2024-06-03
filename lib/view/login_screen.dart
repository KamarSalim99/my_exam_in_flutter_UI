import 'package:exam2_at_flutterui/core/get_it.dart';
import 'package:exam2_at_flutterui/view/people_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController username=TextEditingController();
TextEditingController password=TextEditingController();
class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          Column(
            children: [
              Text(
                "RIIDE",
                style: TextStyle(color: Colors.white,fontSize: 24, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10,),
              Text(
                "Welcome to RIIDE",
                style: TextStyle(color: Colors.white,fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ],
          ),
            SizedBox(width:340,height:48 ,child: buildTextField(username,"Username","Enter your email or username")),
            SizedBox(width:340,height:48 ,child: buildTextField(password,"password","Enter your password")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Remember me",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600),),  
              SizedBox(width: 150,),
              Text("Forgot password",style: TextStyle(color: Color(0xFF1DAEFF),fontSize: 12,fontWeight: FontWeight.w600),),  
            ],),
            InkWell(
              onTap:(){
                core.get<SharedPreferences>().setString('username',username.text);
                if(core.get<SharedPreferences>().getString(username.text)!=null){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PeopleScreen()));
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("Error")),
                  );
                }

              },
              child: Container(
                width: 351,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFF4CE5B1),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Text("Sign up",style: TextStyle(color: Colors.white,fontSize: 11,fontWeight: FontWeight.w800),),)
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Text("Dont have an account? ",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600),),  
              Text("Sign up",style: TextStyle(color: Color(0xFF1DAEFF),fontSize: 15,fontWeight: FontWeight.w600),),  
            ],),
                ],
              ),
        ));
  }
}
Widget buildTextField(TextEditingController controller,String label,String hintText){
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      fillColor: Colors.black,
      filled: true,
      labelText:label,
      labelStyle: TextStyle(color: Color(0xFFCDCDCD),fontSize: 9,fontWeight: FontWeight.w700),
      hintText: hintText,
      hintStyle: TextStyle(color: Color(0xFF5F5F5F),fontSize: 12,fontWeight: FontWeight.w400),
    ),
  );
}