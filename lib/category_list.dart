import 'package:authfirebase/view_product.dart';
import 'package:flutter/material.dart';
import 'components/FadeAnimation.dart';


//CategoryPage(title: 'BuyForGood', image: 'assets/images/category_background.jpg', tag: 'check')
class CategoryPage extends StatefulWidget {
  final String title;
  final String image;
  final String tag;

  const CategoryPage({Key? key,
    required this.title,
    required this.image,
    required this.tag}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: widget.tag,
              child: Material(
                child: Container(
                  height: 230,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.image),
                          fit: BoxFit.cover
                      )
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            colors: [
                              Colors.black.withOpacity(.8),
                              Colors.black.withOpacity(.1),
                            ]
                        )
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                FadeAnimation(1.2, IconButton(
                                  icon: Icon(Icons.search, color: Colors.white,), onPressed: () {},
                                )),
                                FadeAnimation(1.2, IconButton(
                                  icon: Icon(Icons.favorite, color: Colors.white,), onPressed: () {},
                                )),
                                FadeAnimation(1.3, IconButton(
                                  icon: Icon(Icons.shopping_cart, color: Colors.white,), onPressed: () {},
                                )),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 40,
                        ),
                        FadeAnimation(1.2, Text(widget.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40,fontFamily: 'Poppins'),))
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  FadeAnimation(1.4, Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Products", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'Poppins'),),
                      Row(
                        children: <Widget>[
                          Text("Filters", style: TextStyle(color: Colors.grey,fontFamily: 'Poppins'),),
                          SizedBox(width: 5,),
                          Icon(Icons.filter_alt, size: 11, color: Colors.grey,)
                        ],
                      ),
                    ],
                  )),
                  SizedBox(height: 20,),
                  FadeAnimation(1.5, makeProduct(image: 'assets/images/akhapompoms_web_900x.webp', title: 'Akha Pompom Earrings', price: '\$9')),

                  FadeAnimation(1.6, makeProduct(image: 'assets/images/Bluebag.png', title: 'Blue Knot bag', price: '\$18')),
                  FadeAnimation(1.7, makeProduct(image: 'assets/images/flowers.webp', title: 'Unicorn Bouquet-Pastels', price: '\$112.80')
                  ),
                  FadeAnimation(1.8, makeProduct(image: 'assets/images/bracelet.png', title: 'Handmade Bracelet', price: '\$139')),
                  FadeAnimation(1.9, makeProduct(image: 'assets/images/White bag.png', title: 'White Knot bag', price: '\$35')),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget makeProduct({image, title, price}) {
    return Container(
        height: 200,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover
            )
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(.1),
                  ]
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FadeAnimation(1.4, Align(
                alignment: Alignment.topRight,
                //child: Icon(Icons.favorite_border, color: Colors.white,),
              )),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FadeAnimation(1.5, Text(title, style: TextStyle(color: Colors.white, fontSize: 25,fontFamily: 'Poppins'),)),
                      FadeAnimation(1.6, Text(price, style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold,fontFamily: 'Poppins'),)),
                    ],
                  ),
                  FadeAnimation(2, Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                      ),
                      child: Center(
                        child: //Icon(Icons.arrow_forward, size: 18, color: Colors.grey[700],),
                        IconButton(
                          icon: Icon(Icons.arrow_forward, color: Colors.black,),
                          onPressed : () {Navigator.pushNamed(context, '/viewproduct');},
                        ),
                      )
                  ))
                ],
              ),
            ],
          ),
        )
    );

  }


}

/*
class CategoryPage extends StatefulWidget {
  final String title;
  final String image;
  final String tag;

  const CategoryPage({Key? key,
    required this.title,
    required this.image,
    required this.tag}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: widget.tag,
              child: Material(
                child: Container(
                  height: 230,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.image),
                          fit: BoxFit.cover
                      )
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            colors: [
                              Colors.black.withOpacity(.8),
                              Colors.black.withOpacity(.1),
                            ]
                        )
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                FadeAnimation(1.2, IconButton(
                                  icon: Icon(Icons.search, color: Colors.white,), onPressed: () {},
                                )),
                                FadeAnimation(1.2, IconButton(
                                  icon: Icon(Icons.favorite, color: Colors.white,), onPressed: () {},
                                )),
                                FadeAnimation(1.3, IconButton(
                                  icon: Icon(Icons.shopping_cart, color: Colors.white,), onPressed: () {},
                                )),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 40,
                        ),
                        FadeAnimation(1.2, Text(widget.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),))
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  FadeAnimation(1.4, Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Products", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                      Row(
                        children: <Widget>[
                          Text("Filters", style: TextStyle(color: Colors.grey),),
                          SizedBox(width: 5,),
                          Icon(Icons.filter_alt, size: 11, color: Colors.grey,)
                        ],
                      ),
                    ],
                  )),
                  SizedBox(height: 20,),
                  FadeAnimation(1.5, makeProduct(image: 'assets/images/cat_beauty-min.jpg', title: 'Beauty, Health and Wellness', price: '')
                  ),
                  FadeAnimation(1.6, makeProduct(image: 'assets/images/flower.webp', title: 'Unicorn Bouquet - Pastels', price: '')),
                  FadeAnimation(1.7, makeProduct(image: 'assets/images/cat_retail.jpg', title: 'Retail and Gifts', price: '')),
                  FadeAnimation(1.8, makeProduct(image: 'assets/images/cat_community.jpg', title: 'Community Engagement', price: '')),
                  FadeAnimation(1.9, makeProduct(image: 'assets/images/cat_business.jpg', title: 'Business Services', price: '')),
                  FadeAnimation(2.0, makeProduct(image: 'assets/images/cat_home', title: 'Home Services', price: '')),
                  FadeAnimation(2.1,makeProduct(image: 'assets/images/cat_education', title: 'Education and Training', price: '')),
                  FadeAnimation(2.2,makeProduct(image: 'assets/images/cat_events', title: 'Events', price: '')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget makeProduct({image, title, price, tag}) {
    return Container(
        height: 200,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover
            )
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(.1),
                  ]
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FadeAnimation(1.4, Align(
                alignment: Alignment.topRight,
                //child: Icon(Icons.favorite_border, color: Colors.white,),
              )),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  IconButton(onPressed: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => ViewProductPage())), icon: const Icon(Icons.add_shopping_cart, size: 18, color: Colors.grey,)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FadeAnimation(1.5, Text(title, style: TextStyle(color: Colors.white, fontSize: 20),)),
                      FadeAnimation(1.6, Text(price, style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)),
                    ],
                  ),
                  FadeAnimation(2, Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                      ),
                      child: Center(
                        child: Icon(Icons.add_shopping_cart, size: 18, color: Colors.grey[700],),
                      )
                  ))
                ],
              ),
            ],
          ),
        )
    );

  }


}*/