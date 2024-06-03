import 'package:exam2_at_flutterui/model/people_model.dart';
import 'package:exam2_at_flutterui/services/people_services.dart';
import 'package:flutter/material.dart';

TextEditingController searchController = TextEditingController();

class PeopleScreen extends StatelessWidget {
  PeopleScreen({super.key});
  List<PeopleModel> result = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: Container(
        width: 375,
            height: 812,
                decoration: BoxDecoration(
              image: DecorationImage(image: Image.network("assets/images/map.png").image)
            ),
        child: Column(
          children: [
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
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFF0E0E0E)),
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
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFF0E0E0E)),
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
            height:604 ,
              color: Colors.black,
              child: FutureBuilder(
                  future: ImpPeopleServices().getAllPeople(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<PeopleModel> people = snapshot.data as List<PeopleModel>;
                      result = people;
                      return StatefulBuilder(builder: (context, refresh) {
                        return Column(
                          children: [
                            SizedBox(
                              width: 338,
                              height: 42,
                              child: TextField(
                                  controller: searchController,
                                  decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.search,
                                          color: Color(0xFFE4E4E4D4)),
                                      suffixIcon: const Icon(Icons.mic,
                                          color: Color(0xFFE4E4E4D4)),
                                      hintText: "search here ..",
                                      hintStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFFE4E4E4D4)),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15))),
                                  onChanged: (value) {
                                    result = [];
                                    refresh(() {
                                      people.forEach(
                                        (element) {
                                          if (element.name.contains(value)) {
                                            result.add(element);
                                          }
                                        },
                                      );
                                    });
                                  }),
                            ),
                            SizedBox(
                              height: 500,
                              width: 336,
                              child: ListView.builder(
                                itemCount: result.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                    height: 54,
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        foregroundImage:
                                            Image.network(result[index].image)
                                                .image,
                                      ),
                                      title: Row(
                                        children: [
                                          Text(
                                            result[index].name,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const Spacer(),
                                          Container(
                                              alignment: Alignment.center,
                                              width: 14,
                                              height: 15,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xFF4CE5B1),
                                              ),
                                              child: Text(
                                                result[index]
                                                    .unread_message_count
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w700),
                                              )),
                                        ],
                                      ),
                                      subtitle: Text(
                                        result[index].message,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      });
                    } else {
                      return SizedBox( height:10, child: LinearProgressIndicator());
                    }
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
