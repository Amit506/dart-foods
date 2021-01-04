import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SearchedList extends StatefulWidget {
  final List restaurantList1;
  SearchedList({this.restaurantList1});
  @override
  _SearchedListState createState() => _SearchedListState();
}

class _SearchedListState extends State<SearchedList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            physics: ClampingScrollPhysics(),
            itemCount: widget.restaurantList1.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.red[200],
                    offset: Offset(2, 3),
                    spreadRadius: 2,
                    blurRadius: 2,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-1, -1),
                    spreadRadius: -1,
                    blurRadius: 1,
                  ),
                ]),
                child: Card(
                  child: Row(
                    children: [
                      widget
                              .restaurantList1[index]['restaurant']
                                  ['featured_image']
                              .isNotEmpty
                          ? Ink(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        widget.restaurantList1[index]
                                            ['restaurant']['featured_image']),
                                  )),
                            )
                          : Container(
                              height: 100,
                              width: 100,
                              color: Colors.blueGrey,
                              child: Icon(
                                Icons.restaurant,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.restaurantList1[index]['restaurant']
                                        ['name']
                                    .toString(),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.redAccent,
                                    size: 15,
                                  ),
                                  Flexible(
                                    child: Text(
                                      widget.restaurantList1[index]
                                              ['restaurant']['location']
                                              ['locality']
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 12.0,
                              ),
                              RatingBarIndicator(
                                itemSize: 15,
                                rating: double.parse(widget
                                    .restaurantList1[index]['restaurant']
                                        ['user_rating']['aggregate_rating']
                                    .toString()),
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
