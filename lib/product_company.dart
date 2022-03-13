import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class ProductCompany extends StatelessWidget {
  const ProductCompany({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //backgroundColor: Colors.lightGreenAccent,
        body: Column(
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              alignment: Alignment.center,
              children: [
                Image(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height/3,
                  fit: BoxFit.cover,
                  image:NetworkImage('https://raise.sg/images/default_photo_1.jpg'),
                ),
                Positioned(
                  bottom: -60.0,
                  child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      backgroundImage:AssetImage("assets/images/company_logo.jpeg")
                  ),),
              ],
            ),
            SizedBox(height:70.0),
            ListTile(
              title: Center(child: Text("HELLO FLOWERS!", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold), )),
              subtitle: Center(child: Text('Flower Bouquets | Wedding Florals | Workshops',style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold) )),
            ),
            SizedBox(height:5.0),
            ListTile(
              title: Center(child: Text("About Us", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),)),
              subtitle: Center(
                child: Text("Hello Flowers! is a social enterprise floral studio that inspires beautiful moments through its whimsical and nature-inspired creations. More than just a florist brand, Hello Flowers! recognises the therapeutic effect of flowers & nature and we seek to empower and restore others through it.",
                  style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.normal),),
              ),
            ),
            FlatButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.deepOrangeAccent,
              ),
              label: Text(
                "View Products",
                style: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
              ),
              color: Colors.amberAccent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
            FlatButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: Colors.deepOrangeAccent,
              ),
              label: Text(
                "Donate",
                style: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
              ),
              color: Colors.amber,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
          ],
        ));
  }
}
