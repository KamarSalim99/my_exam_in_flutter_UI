 import 'package:dio/dio.dart';
import 'package:exam2_at_flutterui/model/people_model.dart';

abstract class PeopleServices{
  Dio req=Dio();
  late Response response;
  String basUrl="https://664dcb37ede9a2b55654e96c.mockapi.io/api/v1/people";
  Future<List<PeopleModel>> getAllPeople();

}
class ImpPeopleServices extends PeopleServices{
  @override
  Future<List<PeopleModel>> getAllPeople()async {
    try
    {response =await req.get(basUrl);
    if(response.statusCode==200){
      List<PeopleModel> people=List.generate(response.data.length, (index)=>PeopleModel.fromMap(response.data[index]));
       return people;
    }else{
      return [];
    }
   }on DioException catch(e){
    print(e.message);
    return [];
   }
  }

}