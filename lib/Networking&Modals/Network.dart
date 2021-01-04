import 'package:dartfoods/Networking&Modals/Location.dart';


import 'package:dio/dio.dart';


const apiKey = 'a280cbc0ea0709d33f9be43831e0b801';

BaseOptions options = BaseOptions(headers: {
  'user-key': '$apiKey',
  'Accept': 'application/json',
});
Dio dio = new Dio(options);

class QueryNetworking {
  Future getDetails(String query) async {
    var response = await dio
        .get('https://developers.zomato.com/api/v2.1/search', queryParameters: {
      "q": query,
    });
  
    var jsonData = response.data['restaurants'];

    if (response.statusCode == 200) {
      return jsonData;
    } else {
      return null;
    }
  }
}

class CategoryNetworking {
  Future category() async {
    var response =
        await dio.get('https://developers.zomato.com/api/v2.1/categories');
    print(response.statusCode);
    var jsonData = response.data['categories'];
    print(jsonData);
    if (response.statusCode == 200) {
      return jsonData;
    } else {
      return null;
    }
  }
}

class CityNetworking {
  Future cityRestaurants() async {
Location location= Location();
await location.getCurrentLocation();
    var response = await dio.get(
        'https://developers.zomato.com/api/v2.1/geocode?lat=${location.latitude==null?28.6180231
:location.latitude}&lon= ${location.longitude==null?77.0366936
:location.longitude}');
    
    var jsonData = response.data['nearby_restaurants'];
     var jsonData2 = response.data['popularity'];
     print(location.latitude);
     print(location.longitude);
    print( jsonData2 );
  return jsonData;
   
    
  }
}

