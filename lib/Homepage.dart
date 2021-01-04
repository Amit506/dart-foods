
import 'package:dartfoods/Networking&Modals/Network.dart';
import 'package:dartfoods/TabBars.dart/TabBar1.dart';
import 'package:flutter/material.dart';
import 'package:dartfoods/Screens.dart/SearchPage.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


List nearRestaurant=[];
bool loading = true;

void nearBy()async{
CityNetworking cityNetworking= CityNetworking();
nearRestaurant=await cityNetworking.cityRestaurants();
setState(() {
  loading=false;
});


}




  @override

void initState(){
  super.initState();
  nearBy();
}


  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
    
    child: Scaffold(
      body: NestedScrollView(headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){

        return [
              SliverAppBar(
              title: Text('Dart Foods'),
              backgroundColor: Colors.red,
              expandedHeight: 100,
              bottom: TabBar(
                tabs: [
                  Text('Near By'),
                  Text('Popular'),
                  Text('Category')
                ],
              ),
            ),

        ];
      },
      body: TabBarView(
        children: [
                loading?Center(child: CircularProgressIndicator(),):
                  
                  TabBar1(restaurants: nearRestaurant,),
                   loading?Center(child: CircularProgressIndicator(),):
                
                  TabBar1(restaurants: nearRestaurant,),
                   loading?Center(child: CircularProgressIndicator(),):
                 
                  TabBar1(restaurants: nearRestaurant,),


        ],
      ),
      
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label : 'home',

          ),
         
           BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return SearchPage();
                }));
              },
              child: Icon(Icons.search)),
            label : 'search',

          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label : 'shop',

          ),

        ],
      ),
    ),
    
    
     );
  }
}
