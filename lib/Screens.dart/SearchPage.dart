import 'package:flutter/material.dart';
import 'Searchlist.dart';
import '../Networking&Modals/Network.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchKey = '';
  bool searchList = false;
  bool loading = false;
  List restaurantList;

  void getDetails(searchKey) async {
    QueryNetworking network = new QueryNetworking();
    restaurantList = await network.getDetails(searchKey);
    setState(() {
      searchList = true;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30)),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.red),
                ),
              ),
              Positioned(
                bottom: 40,
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Material(
                        elevation: 6,
                        child: Container(
                            decoration: BoxDecoration(color: Colors.red),
                            height: 48,
                            width: MediaQuery.of(context).size.width * 0.84,
                            child: buildTextFormField()),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.87,
            child: buildFlatButton(),
          ),
          loading
              ? Container(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  child: searchList
                      ? SearchedList(
                          restaurantList1: restaurantList,
                        )
                      : SizedBox(height: 1),
                ),
        ],
      ),
    );
  }

  Container buildFlatButton() {
    return Container(
      child: RaisedButton(
          elevation: 3,
          color: Colors.red,
          disabledColor: Colors.red[400],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: () {
            setState(() {
              loading = true;
              getDetails(searchKey);
              FocusManager.instance.primaryFocus.unfocus();
            });
          },
          child: Text(
            'Search',
            style: TextStyle(color: Colors.white, fontSize: 16),
          )),
    );
  }

  TextFormField buildTextFormField() {
    return TextFormField(
      onChanged: (value) {
        searchKey = value;
      },
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          hintText: ' Search restaurants here....',
          prefixIcon: Icon(
            Icons.search,
            color: Colors.redAccent,
          ),
          contentPadding: EdgeInsets.symmetric(vertical:3),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.red[300], width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.red[300], width: 2)),
          suffixIcon: Icon(
            Icons.restaurant,
            color: Colors.redAccent,
          ),
          filled: true,
          fillColor: Colors.red[50],

          errorStyle: TextStyle(fontSize: 10.0)),
    );
  }
}
