import 'package:authfirebase/chat.dart';
import 'package:authfirebase/constants.dart';
import 'package:authfirebase/product_company.dart';
import 'Login.dart';
import 'color_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'rating_bottomsheet.dart';
import 'more_products.dart';
import 'components/product_options.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'product.dart';

class ViewProductPage extends StatefulWidget {
  final Product product = Product(
      'assets/images/flowers.webp',
      'Unicorn Bouquet - Pastels',
      'Unicorn is all things pastel and romantic through a mixture of soft colours.(eg. pinks, lilacs, champagne colours, etc). '
          'Using only the freshest in-season flowers, we craft the flowers based on the chosen colour palette in our rustic style.'
          'Surprise your loved ones with our flowers today! -winks-',
      45.3);



  @override
  _ViewProductPageState createState() => _ViewProductPageState();
}

class _ViewProductPageState extends State<ViewProductPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int active = 0;

  @override
  Widget build(BuildContext context) {
    Widget description = Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
          widget.product.description,
          maxLines: 10,
          semanticsLabel: '...',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.black, fontSize: 15,fontFamily: 'Poppins', fontWeight: FontWeight.normal)//fontStyle: FontStyle.italic),
      ),
    );

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.orange[200]),
          leading: new IconButton(
            //icon:
            /*new SvgPicture.asset(
              'assets/icons/home_icon.svg',
              fit: BoxFit.scaleDown,
            ),
            onPressed: () {},*/
            icon: Icon(Icons.arrow_back, color: Colors.black,),
            onPressed : () {Navigator.pop(context);},
          ),
          actions: <Widget>[
            IconButton(
              icon: new Icon(
                Icons.person, color: Colors.black,
              ),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => ProductCompany())),
            )
          ],
          title: Text(
            'Hello Flowers',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey[900],
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins",
                fontSize: 18.0),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                ProductOption(
                  _scaffoldKey,
                  product: widget.product,
                ),
                description,
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(

                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) => ChatFunction()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange[300],
                        ),
                        child: Row(
                          children: <Widget>[
                            Text('Chat with us ', style: TextStyle(color: Colors.white,fontFamily: 'Poppins', fontWeight: FontWeight.bold),),
                            Icon(Icons.chat,
                                color: Color.fromRGBO(255, 137, 147, 1)),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return RatingBottomSheet();
                          },
                          //elevation: 0,
                          //backgroundColor: Colors.transparent
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange[300],
                      ),
                      child: Row(
                        children: <Widget>[
                          Text('Reviews ', style: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontWeight: FontWeight.bold),),
                          Icon(Icons.comment,
                              color: Color.fromRGBO(255, 137, 147, 1)),
                        ],
                      ),
                    ),
                  ]),
                ),
                MoreProducts()
              ],
            ),
          ),
        ));
  }
}