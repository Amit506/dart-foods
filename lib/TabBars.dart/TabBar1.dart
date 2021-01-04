import 'package:dartfoods/TabBars.dart/InsideTabBar1.dart/wrapContainer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TabBar1 extends StatefulWidget {
  final List restaurants;
  TabBar1({this.restaurants});
  @override
  _TabBar1State createState() => _TabBar1State();
}

class _TabBar1State extends State<TabBar1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Flexible(
          child: CarouselSlider.builder(
              itemCount: widget.restaurants.length,
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: FadeInImage.assetNetwork(
                          height: 200,
                          width: MediaQuery.of(context).size.width * 0.8,
                          fit: BoxFit.cover,
                          placeholder: 'assets/adb26f32ba9386c7-.gif',
                          image: widget.restaurants[index]['restaurant']
                                      ['featured_image'] !=
                                  null
                              ? widget.restaurants[index]['restaurant']
                                  ['featured_image']
                              : widget.restaurants[index]['restaurant']
                                  ['thumb'],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.red[400].withAlpha(90),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.restaurants[index]['restaurant']['name'],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RatingBarIndicator(
                                    itemSize: 15,
                                    rating: double.parse(widget
                                        .restaurants[index]['restaurant']
                                            ['user_rating']['aggregate_rating']
                                        .toString()),
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  Text(
                                    widget.restaurants[index]['restaurant']
                                        ['user_rating']['rating_text'],
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 3)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          height: 30,
          width: MediaQuery.of(context).size.width,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Top Cuisines',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
            Text(
              'more...',
              style: TextStyle(fontSize: 7),
            ),
          ]),
        ),
        Divider(),
        Wrap(
          spacing: 15.0,
          runSpacing: 10,
          children: [
            WrapContainer(
              imageFile: 'assets/1_InlgltnGNwj7W93dJ_oQ_g.jpeg',
              imageTitle: 'South Indian',
            ),
            WrapContainer(
              imageFile:
                  'assets/depositphotos_24762569-stock-photo-fast-food-hamburger-hot-dog.jpg',
              imageTitle: 'Fast Food',
            ),
            WrapContainer(
              imageFile: 'assets/h3av5syuw4cqwgxeqw8r.jpg',
              imageTitle: 'Chinese',
            ),
            WrapContainer(
              imageFile:
                  'assets/Mandatory-acrylamide-action-could-be-in-place-by-spring-2018.jpg',
              imageTitle: 'Bakery',
            ),
            WrapContainer(
              imageFile: 'assets/north-indian-food-livemorezone-dbs.jpg',
              imageTitle: 'North Indian',
            ),
            WrapContainer(
              imageFile: 'assets/53096628.jpg',
              imageTitle: 'Biryani',
            ),
          ],
        ),
      ]),
    );
  }
}
