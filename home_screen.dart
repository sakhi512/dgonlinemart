

import 'package:dgonlinemart/providers/product_provider.dart';
import 'package:dgonlinemart/providers/user_provider.dart';
import 'package:dgonlinemart/screens/review_cart/review_cart.dart';
import 'package:dgonlinemart/screens/search/search.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:dgonlinemart/screens/home/singal_product.dart';
import 'drawer_side.dart';
import 'package:dgonlinemart/config/colors.dart';



class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 late ProductProvider productProvider;
  Widget _buildHerbsProduct(context) {

    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Padding(

          padding: const EdgeInsets.symmetric(vertical: 20),

          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

              Text('MEDICINE'),

              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Search( search:productProvider.getHurbsProductDataList )
                  )
                  );
                },

                child: Text(

                  'VIEW ALL',

                  style: TextStyle(color: Colors.grey),

                ),
              ),

            ],

          ),

        ),

        SingleChildScrollView(

          scrollDirection: Axis.horizontal,

          child: Row(
children: productProvider.getHurbsProductDataList.map((e) {
  return SingalProduct(productId:e.productId,productImage: e.productImage,
      productName: e.productName, productPrice: e.productPrice,onTap: (){});
}).toList(),

          ),

        ),

      ],

    );

  }

  Widget _buildFreshProduct(context) {

    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Padding(

          padding: const EdgeInsets.symmetric(vertical: 20),

          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children:  [

              Text('Herbs Seasonings'),

              GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Search( search:productProvider.getjuicesProductDataList )
                )
                );
              },

                child: Text(

                  'view all',

                  style: TextStyle(color: Colors.grey),

                ),
              ),

            ],

          ),

        ),

        SingleChildScrollView(

          scrollDirection: Axis.horizontal,

          child: Row(
               children: productProvider.getjuicesProductDataList.map((e) {
                 return SingalProduct(productId:e.productId,productImage: e.productImage,
                     productName: e.productName, productPrice: e.productPrice, onTap: (){},);

               }).toList(),
          ),

        ),

      ],

    );

  }

  Widget _buildRootProduct(context) {

    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Padding(

          padding: const EdgeInsets.symmetric(vertical: 20),

          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

              Text('Herbs Seasonings'),

              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Search( search:productProvider.getdrinksProductDataList )
                  )
                  );
                },

                child: Text(

                  'view all',

                  style: TextStyle(color: Colors.grey),

                ),
              ),

            ],

          ),

        ),

        SingleChildScrollView(

          scrollDirection: Axis.horizontal,

          child: Row(
            children: productProvider.getdrinksProductDataList.map((e) {
              return SingalProduct(productId:e.productId,productImage: e.productImage, productName: e.productName, productPrice: e.productPrice, onTap: (){});
            }).toList(),

          ),

        ),

      ],

    );

  }
  //
  @override
  void initState(){
    ProductProvider productProvider=Provider.of(context,listen:false);
    productProvider.fatchHurbsProductData();
    productProvider.fatchDrinksProductData();
    productProvider.fatchJuicesProductData();



    super.initState();
  }



  @override

  Widget build(BuildContext context) {
    UserProvider userProvider=Provider.of(context);
    userProvider.getUserData();
    final size=MediaQuery.of(context).size;

    productProvider=Provider.of(context);



    return Scaffold(

      drawer: DrawerSide(
        userProvider: userProvider,


      ),

      appBar: AppBar(

        backgroundColor: myColor,

        iconTheme: IconThemeData(color: Colors.white),

        title: Text(

          'Home',

          style: TextStyle(color:Colors.white, fontSize: 17),

        ),

        actions: [

          CircleAvatar(

            backgroundColor: myColor,

            radius: 12,

            child: IconButton(
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(search: productProvider.getAllProductDataList,)));

              },
              icon:Icon(
              Icons.search,

              size: 17,

              color: Colors.white,
              ),
            ),

          ),

          Padding(

            padding: const EdgeInsets.symmetric(horizontal: 5),

            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewCart()));
              },
              child: CircleAvatar(

                backgroundColor: myColor,

                radius: 12,

                child: Icon(

                  Icons.add_shopping_cart,

                  size: 17,

                  color: Colors.white,

                ),

              ),
            ),

          ),

        ],

      ),

      body: Padding(

        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),

        child: ListView(

          children: [

            Container(

              height: 150,

              decoration: BoxDecoration(

                image: const DecorationImage(

                  fit: BoxFit.cover,

                  image: NetworkImage(

                  'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAATcAAACiCAYAAAAk/op2AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEaGlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSfvu78nIGlkPSdXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQnPz4KPHg6eG1wbWV0YSB4bWxuczp4PSdhZG9iZTpuczptZXRhLyc+CjxyZGY6UkRGIHhtbG5zOnJkZj0naHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyc+CgogPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9JycKICB4bWxuczpBdHRyaWI9J2h0dHA6Ly9ucy5hdHRyaWJ1dGlvbi5jb20vYWRzLzEuMC8nPgogIDxBdHRyaWI6QWRzPgogICA8cmRmOlNlcT4KICAgIDxyZGY6bGkgcmRmOnBhcnNlVHlwZT0nUmVzb3VyY2UnPgogICAgIDxBdHRyaWI6Q3JlYXRlZD4yMDIyLTEyLTI0PC9BdHRyaWI6Q3JlYXRlZD4KICAgICA8QXR0cmliOkV4dElkPmU4MzQ3OWQ5LTdiZjEtNDBkMS1iMmUzLWE1ZmFiN2VkMTczODwvQXR0cmliOkV4dElkPgogICAgIDxBdHRyaWI6RmJJZD41MjUyNjU5MTQxNzk1ODA8L0F0dHJpYjpGYklkPgogICAgIDxBdHRyaWI6VG91Y2hUeXBlPjI8L0F0dHJpYjpUb3VjaFR5cGU+CiAgICA8L3JkZjpsaT4KICAgPC9yZGY6U2VxPgogIDwvQXR0cmliOkFkcz4KIDwvcmRmOkRlc2NyaXB0aW9uPgoKIDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PScnCiAgeG1sbnM6ZGM9J2h0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvJz4KICA8ZGM6dGl0bGU+CiAgIDxyZGY6QWx0PgogICAgPHJkZjpsaSB4bWw6bGFuZz0neC1kZWZhdWx0Jz5EaWdpdGFsIC0gMTwvcmRmOmxpPgogICA8L3JkZjpBbHQ+CiAgPC9kYzp0aXRsZT4KIDwvcmRmOkRlc2NyaXB0aW9uPgoKIDxyZGY6RGVzY3JpcHRpb24gcmRmOmFi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'
                  ),

                ),

                color: myColor,

                borderRadius: BorderRadius.circular(10),

              ),

              child: Row(

                children: [

                  Expanded(

                    flex: 2,

                    child: Column(

                      children: [

                        Padding(

                          padding:

                          const EdgeInsets.only(right: 130, bottom: 10),

                          child: Container(

                            height: 50,

                            width: 100,

                            decoration: const BoxDecoration(

                              color: Colors.black,

                              borderRadius: BorderRadius.only(

                                bottomRight: Radius.circular(50),

                                bottomLeft: Radius.circular(50),

                              ),

                            ),

                            child: const Center(

                              child: Text(

                                'Order Us',

                                style: TextStyle(

                                  fontSize: 20,

                                  color: Color(0xfff41b27),

                                  shadows: [

                                    BoxShadow(

                                        color: Colors.green,

                                        blurRadius: 10,

                                        offset: Offset(3, 3))

                                  ],

                                ),

                              ),

                            ),

                          ),

                        ),

                        Text(

                          '10% Off ',

                          style: TextStyle(

                              fontSize: 40,

                              color: Colors.white,

                              fontWeight: FontWeight.bold),

                        ),

                        const Padding(

                          padding: EdgeInsets.only(left: 20),

                          child: Text(

                            'On all medicine products',

                            style: TextStyle(

                              color: Colors.white,

                            ),

                          ),

                        ),

                      ],

                    ),

                  ),

                  Expanded(

                    child: Container(),

                  ),

                ],

              ),

            ),


            Material(
              // elevation: 4,
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                
                child: Container(
                  
                  height: 150,
                  width: 400,
                  child: Row(
                    children: [

                      Container(
                        
                        child: Column(
                          children: [
                            MaterialButton(
                              onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(search: productProvider.getAllProductDataList)))  ;                        },
                              child: CircleAvatar(
                                backgroundColor: Colors.white,

radius: 50,
                                  backgroundImage:
                                    AssetImage

                                      ("images/pharmacy.png",
                                    ),

                              ),
                              
                            ),
                            Text("Medicine")
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 36,
                        height: 36,
                      ),
                      Column(
                        children: [
                          MaterialButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                              Fluttertoast.showToast(
                                  msg: 'Service not Avaliable',
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: myColor,
                                  textColor:Colors.white,);
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.white,


                              radius: 50,
                              backgroundImage:
                              AssetImage

                                ("images/grocery.png",
                                // itemdata[index].imageUrl
                              ),





                            ),
                          ),
                          Text("Grocery"),
                        ],
                      ),
                      
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 2,height: 2,),
            Material(
              // elevation: 4,
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.all(20.0),

                child: Container(

                  height: 150,
                  width: 400,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          MaterialButton(
                            onPressed: (){

                              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                              Fluttertoast.showToast(
                                msg: 'Service not Avaliable',
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: myColor,
                                textColor: Colors.white,);
                              },
                            child: CircleAvatar(
                              backgroundColor: Colors.white,

                              radius: 50,
                              backgroundImage:
                              AssetImage

                                ("images/meat.jpg",
                                // itemdata[index].imageUrl
                              ),





                            ),
                          ),
                          Text("Vegetable and Meat"),
                        ],
                      ),
                      SizedBox(
                        width: 36,
                        height: 36,
                      ),

                    ],
                  ),
                ),
              ),
            ),

          ],

        ),

      ),

    );

  }
}




