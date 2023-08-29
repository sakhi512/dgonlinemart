import 'package:dgonlinemart/my_pofile/my_profile.dart';
import 'package:dgonlinemart/screens/review_cart/review_cart.dart';
import 'package:dgonlinemart/screens/wishList/wish_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dgonlinemart/config/colors.dart';
import 'package:dgonlinemart/screens/home/home_screen.dart';
import '../../providers/user_provider.dart';

class DrawerSide extends StatefulWidget {
  UserProvider userProvider;
  DrawerSide(
  {required this.userProvider}
  );
  @override
  State<DrawerSide> createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {

  Widget listTile(
      {required String title, required IconData iconData
        , required VoidCallback onTap
      }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        iconData,
        size: 28,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
    );
  }

  //     DrawerSide();
  @override
  Widget build(BuildContext context) {
    var userData = widget.userProvider.currentUserData;
    return Drawer(
      child: Container(
        color: myColor,
        child: ListView(
          children: [
            DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 43,
                      backgroundColor: Colors.white54,
                      child: CircleAvatar(
                        backgroundColor: myColor,
                        backgroundImage: NetworkImage(
                          userData.userImage ,
                           // "https://s3.envato.com/files/328957910/vegi_thumb.png",
                        ),
                        radius: 40,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(userData.userName,style: TextStyle(color: Colors.white)),
                        Text(userData.userEmail,style: TextStyle(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            listTile(
              iconData: Icons.home,
              title: "Home",

              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
            ),
            listTile(
              iconData: Icons.add_shopping_cart,
              title: "Review Cart",

              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReviewCart(),
                  ),
                );
              },
            ),
            listTile(
              iconData: Icons.account_box_outlined,
              title: "My Profile",

              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyProfile(userProvider: widget.userProvider),
                  ),
                );
              },
            ),
            listTile(

                iconData: Icons.favorite_outline,
                title: "Wishlist",

                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WishList(),
                    ),
                  );
                }
            ),
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Support",style: TextStyle(color: Colors.white)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Call us:",style: TextStyle(color: Colors.white)),
                      SizedBox(
                        width: 10,
                      ),
                      Text("+923306783738",style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("Mail us:",style: TextStyle(color: Colors.white)),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "sakhiabbas847@gmail.com",style: TextStyle(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}