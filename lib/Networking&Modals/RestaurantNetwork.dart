
import 'package:dio/dio.dart';

const apiKey = 'a280cbc0ea0709d33f9be43831e0b801';

BaseOptions options = BaseOptions(headers: {
  'user-key': '$apiKey',
  'Accept': 'application/json',
});
Dio dio = new Dio(options);



class RestaurantDetailNetworking{
   var resId= 123244;//
  
   Future resDetail() async {
   


    var response =
        await dio.get('  https://developers.zomato.com/api/v2.1/restaurant?res_id=$resId');
    print(response.statusCode);
    var jsonData = response.data['categories'];
    print(jsonData);
    
  }
      
  Future dailyMenu() async {
   


    var response =
        await dio.get(' https://developers.zomato.com/api/v2.1/dailymenu?res_id=$resId');
    print(response.statusCode);
    var jsonData = response.data['categories'];
    print(jsonData);
    
  }
}
