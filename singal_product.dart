import 'package:dgonlinemart/Widget/count.dart';
import 'package:dgonlinemart/Widget/product_unit.dart';
import 'package:dgonlinemart/screens/product_overview/product_overview.dart';
import 'package:flutter/material.dart';
class SingalProduct extends StatefulWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  final String productId;

  final VoidCallback onTap;

  SingalProduct({required this.productId,required this.productImage,required this.productName,
    required this.productPrice,required this.onTap});

  @override
  State<SingalProduct> createState() => _SingalProductState();
}

class _SingalProductState extends State<SingalProduct> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
      Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 230,
      width: 160,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductOverview(widget.productId,
                  widget.productImage, widget.productName,widget. productPrice,)
              ));
            },
            child: Container(
              height: 150,
              padding: EdgeInsets.all(5),
              width: double.infinity,
              child: Image.network(
                widget.productImage,
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Fresh Basil",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              Text("fresh Basil",style: TextStyle(color: Colors.grey),)
            ],
          ),

          Row(
            children: [
              Expanded(
                  child:ProductUnit(
                    title: "50Gram",
                    onTap: (){
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: new Icon(Icons.photo),
                                title: new Text('Photo'),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: new Icon(Icons.music_note),
                                title: new Text('Music'),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: new Icon(Icons.videocam),
                                title: new Text('Video'),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: new Icon(Icons.share),
                                title: new Text('Share'),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        });
                  },),

              ),
              SizedBox(width: 5,),
             Count(
               productName: widget.productName,
                 productId: widget.productId,
                 productImage: widget.productImage,
                 productPrice: widget.productPrice,
             ),
            ],
          )


        ],
      ),
    ),

        ],
      ),
    );

  }
}
