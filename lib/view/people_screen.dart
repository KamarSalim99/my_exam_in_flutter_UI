import 'package:exam2_at_flutterui/model/people_model.dart';
import 'package:exam2_at_flutterui/services/people_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

TextEditingController searchController=TextEditingController();
class PeopleScreen extends StatelessWidget {
   PeopleScreen({super.key});
List<PeopleModel> result=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Colors.black,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.arrow_back_ios,color: Color(0xFFE4E4E4D4),),
                  Text("Invite Friends",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w800,color: Color(0xFFE4E4E4D4)),),
                  Icon(Icons.delete,color: Color(0xFFE4E4E4D4)),
                ],
              ),
            ),
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search,color: Color(0xFFE4E4E4D4)),
                suffixIcon: Icon(Icons.mic,color: Color(0xFFE4E4E4D4)),
                hintText: "search here ..",
                hintStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFFE4E4E4D4)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
              ),
              // onChanged: (value) {
              //       result = [];
              //                     refresh(() {
              //                       people.forEach(
              //                         (element) {
              //                           if (element.title.contains(value)) {
              //                             result.add(element);
              //                           }
              //                         },
              //                       );
              // });}
              ),
            FutureBuilder(future: ImpPeopleServices().getAllPeople(), builder: (context,snapshot){
              if(snapshot.hasData)
              {
                //List<PeopleModel> people=List.generate(snapshot.data!.length, (ind)=>PeopleModel.fromMap(snapshot.data![ind] as Map<String, dynamic>));
                //result=people;
                return SizedBox(
                  height: 400,
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        foregroundImage:Image.network(snapshot.data![index].image).image, 
                        ),
                      title: Row(
                        children: [
                          Text(snapshot.data![index].name,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
                          SizedBox(width: 10,),
                          Text(snapshot.data![index].unread_message_count.toString(),style: TextStyle(color:Colors.white, fontSize: 14,fontWeight: FontWeight.w400),),
                          Spacer(),
                          Text(snapshot.data![index].date,style: TextStyle(color:Colors.white, fontSize: 14,fontWeight: FontWeight.w400),),
                        ],
                      ),
                      subtitle: Text(snapshot.data![index].message,style: TextStyle(color:Colors.white ,fontSize: 16,fontWeight: FontWeight.w500),),
                                
                    );
                    },),
                );
             }else{
              return LinearProgressIndicator();
             }
            })
          ],
        ),
      )
    );
  }
}