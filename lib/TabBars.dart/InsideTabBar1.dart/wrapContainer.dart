import 'package:flutter/material.dart';


class WrapContainer extends StatefulWidget {
  final imageFile;
  final imageTitle;
  WrapContainer({this.imageFile,this.imageTitle});
  @override
  _WrapContainerState createState() => _WrapContainerState();
}

class _WrapContainerState extends State<WrapContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
              padding: EdgeInsets.only(
                 left: 10,
                 right: 10,
                 top: 13,
                 bottom: 3
              ),
              height: 110,
              width: 90,
              decoration: BoxDecoration(
                  color: Colors.red[500],
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
             
                children: [
                  Container(
                   
                    child: ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                      child: Image.asset(widget.imageFile,fit: BoxFit.cover,height: 70,width: 60,)),
                  ),
                  
                 
                    
                      
                     Padding(
                       padding: const EdgeInsets.all(6.0),
                       child: Text(widget.imageTitle,style: TextStyle(color: Colors.white,fontSize: 10),),
                     )
                ],
              ),
            );
  }
}