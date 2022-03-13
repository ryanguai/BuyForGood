import 'package:card_swiper/card_swiper.dart';
import 'app_properties.dart';
// import 'package:ecommerce_int2/screens/address/add_address_page.dart';
// import 'package:ecommerce_int2/screens/payment/unpaid_page.dart';
import 'package:flutter/material.dart';
import 'product.dart';
import 'payment.dart';
import 'shop_item_list.dart';

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  SwiperController swiperController = SwiperController();

  List<Product> products = [
    Product('assets/images/Bluebag.png',
        'Blue Knot Bag', 'description', 18),
    Product('assets/images/bracelet.png',
        'Handmade bracelet', 'description', 139),
    Product('assets/images/White bag.png',
        'White Knot Bag', 'description', 35)
  ];

  @override
  Widget build(BuildContext context) {
    Widget checkOutButton = InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => PaymentPage())),
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            gradient: mainButton,
            boxShadow: [
              BoxShadow(
                color: Colors.redAccent,
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ],
            borderRadius: BorderRadius.circular(9.0)),
        child: Center(
          child: Text("Check Out",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          /*IconButton(
            icon: Image.asset('assets/images/bluebag.png'),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => UnpaidPage())),
          )*/
        ],
        title: Text(
          'Checkout',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 24.0),
        ),
      ),
      body: LayoutBuilder(
        builder: (_, constraints) => SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  height: 48.0,
                  color: Colors.orange,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Subtotal',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        products.length.toString() + ' items',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 500,
                  child: Scrollbar(
                    child: ListView.builder(
                      itemBuilder: (_, index) => ShopItemList(
                        products[index],
                        onRemove: () {
                          setState(() {
                            products.remove(products[index]);
                          });
                        },
                      ),
                      itemCount: products.length,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  /*child: Text(
                    'Payment',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),*/
                ),
                /*SizedBox(
                  height: 250,
                  child: Swiper(
                    itemCount: 2,
                    itemBuilder: (_, index) {
                      return CreditCard();
                    },
                    scale: 0.8,
                    //controller: swiperController,
                    viewportFraction: 0.6,
                    loop: false,
                    fade: 0.7,
                  ),
                )*/
                SizedBox(height: 0), //24
                Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).padding.bottom == 0
                              ? 20
                              : MediaQuery.of(context).padding.bottom),
                      child: checkOutButton,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Scroll extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    LinearGradient grT = LinearGradient(
        colors: [Colors.transparent, Colors.black26],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter);
    LinearGradient grB = LinearGradient(
        colors: [Colors.transparent, Colors.black26],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter);

    canvas.drawRect(
        Rect.fromLTRB(0, 0, size.width, 30),
        Paint()
          ..shader = grT.createShader(Rect.fromLTRB(0, 0, size.width, 30)));

    canvas.drawRect(Rect.fromLTRB(0, 30, size.width, size.height - 40),
        Paint()..color = Color.fromRGBO(50, 50, 50, 0.4));

    canvas.drawRect(
        Rect.fromLTRB(0, size.height - 40, size.width, size.height),
        Paint()
          ..shader = grB.createShader(
              Rect.fromLTRB(0, size.height - 40, size.width, size.height)));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}