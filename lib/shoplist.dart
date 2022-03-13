import 'package:authfirebase/category_list.dart';
import 'package:authfirebase/chat.dart';
import 'package:flutter/material.dart';
import 'package:authfirebase/Login.dart';
//import 'package:authfirebase/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Shop extends StatefulWidget{
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop>{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("start");
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:
      Column(
        children: <Widget>[
          Container(
              height:450,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/category_background.jpg'),
                      fit: BoxFit.cover
                  )
              ),
              child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors:[
                            Colors.black.withOpacity(.8),
                            Colors.black.withOpacity(.2),
                          ]
                      )
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.logout, color: Colors.white,),
                                onPressed : () {Navigator.pushNamed(context, 'start');},
                              ),
                              SizedBox(width: 10,),
                              //Icon(Icons.favorite, size: 30, color: Colors.grey,),
                              IconButton(
                                icon: Icon(Icons.favorite, color: Colors.white,),
                                onPressed : signOut,
                              ),
                              SizedBox(width: 10,),
                              //Icon(Icons.shopping_cart, size: 30, color: Colors.grey,)
                              IconButton(
                                icon: Icon(Icons.shopping_cart, color: Colors.white,),
                                onPressed : () {Navigator.pushNamed(context, '/login');},
                              ),
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Hello Nash, Welcome to Buy For Good", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),),
                                  SizedBox(width: 20,),
                                  Text("Go local, Go small", style: TextStyle(color: Colors.white, fontSize: 16,fontFamily: 'Poppins'),),
                                ],
                              )
                          )
                        ],
                      )
                  )
              )
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Categories", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold,fontFamily: 'Poppins'),),
                    Text("All", style: TextStyle(color: Colors.black,fontSize:15, fontFamily:'Poppins'),)
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      makeCategory(image: 'assets/images/cat_beauty-min.jpg', title: 'Beauty & Wellness', tag: 'beauty'),
                      makeCategory(image: 'assets/images/cat_food.jpg', title: 'Food and Beverage',tag: 'food'),
                      makeCategory(image: 'assets/images/cat_retail.jpg', title: 'Retail and Gifts',tag: 'retail'),
                      makeCategory(image: 'assets/images/cat_community.jpg', title: 'Community Engagement',tag: 'community'),
                      makeCategory(image: 'assets/images/cat_business.jpg', title: 'Business Services',tag: 'business'),
                      makeCategory(image: 'assets/images/cat_home.jpg', title: 'Home Services',tag: 'home'),
                      makeCategory(image: 'assets/images/cat_education.jpg', title: 'Education and Training',tag: 'education'),
                      makeCategory(image: 'assets/images/cat_events.jpg', title: 'Events',tag: 'events'),

                    ],
                  ),
                )
              ],
            ),
          )
        ],

      ),

    );
  }

  Widget makeCategory({image, title, tag}) {
    return AspectRatio(
      aspectRatio: 2/2.2,
      child: Hero(
        tag: tag,
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage(title: title, image: image, tag: tag)));
          },
          child: Material(
            child: Container(
              margin: EdgeInsets.only(right: 20),
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
                        colors:[
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(.0),
                        ]
                    )
                ),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(title, style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.bold,fontFamily: 'Poppins'),)
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}


/*
class Shop extends StatefulWidget{
  @override
  _ShopState createState() => _ShopState();
}



class _ShopState extends State<Shop>{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("start");
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:
      Column(
        children: <Widget>[
          Container(
              height:450,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/category_background.jpg'),
                      fit: BoxFit.cover
                  )
              ),
              child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors:[
                            Colors.black.withOpacity(.8),
                            Colors.black.withOpacity(.2),
                          ]
                      )
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.logout, color: Colors.white,),
                                onPressed : signOut,
                              ),
                              SizedBox(width: 10,),
                              //Icon(Icons.favorite, size: 30, color: Colors.grey,),
                              IconButton(
                                icon: Icon(Icons.favorite, color: Colors.white,),
                                onPressed : () => Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) => ChatFunction())),
                              ),
                              SizedBox(width: 10,),
                              //Icon(Icons.shopping_cart, size: 30, color: Colors.grey,)
                              IconButton(
                                icon: Icon(Icons.shopping_cart, color: Colors.white,),
                                onPressed : () {Navigator.pushNamed(context, '/login');},
                              ),
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Hello ${user.displayName}, Welcome to Buy For Good", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                                  SizedBox(width: 10,),
                                ],
                              )
                          )
                        ],
                      )
                  )
              )
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Categories", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                    Text("All")
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      makeCategory(image: 'assets/images/cat_beauty-min.jpg', title: 'Beauty & Wellness', tag: 'beauty'),
                      makeCategory(image: 'assets/images/cat_food.jpg', title: 'Food and Beverage',tag: 'food'),
                      makeCategory(image: 'assets/images/cat_retail.jpg', title: 'Retail and Gifts',tag: 'retail'),
                      makeCategory(image: 'assets/images/cat_community.jpg', title: 'Community Engagement',tag: 'community'),
                      makeCategory(image: 'assets/images/cat_business.jpg', title: 'Business Services',tag: 'business'),
                      makeCategory(image: 'assets/images/cat_home.jpg', title: 'Home Services',tag: 'home'),
                      makeCategory(image: 'assets/images/cat_education.jpg', title: 'Education and Training',tag: 'education'),
                      makeCategory(image: 'assets/images/cat_events.jpg', title: 'Events',tag: 'events'),

                    ],
                  ),
                )
              ],
            ),
          )
        ],

      ),

    );
  }

  Widget makeCategory({image, title, tag}) {
    return AspectRatio(
      aspectRatio: 2/2.2,
      child: Hero(
        tag: tag,
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage(title: title, image: image, tag: tag)));
          },
          child: Material(
            child: Container(
              margin: EdgeInsets.only(right: 20),
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
                        colors:[
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(.0),
                        ]
                    )
                ),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(title, style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.bold),)
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}*/