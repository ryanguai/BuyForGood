import 'package:authfirebase/product.dart';
import 'package:authfirebase/payment.dart';
//import 'package:buy_for_good/register.dart';
import 'package:flutter/material.dart';
import 'package:authfirebase/checkout.dart';
import 'shop_bottom_sheet.dart';

class ProductOption extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Product product;
  const ProductOption(
      this.scaffoldKey, {
        required this.product,
      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0.0,
            child: Image.asset(
              product.image,
              height: 200,
              width: 200,
            ),
          ),
          Positioned(
            right: 0.0,
            child: Container(
              height: 180,
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(product.name,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                            fontFamily: 'Poppins'
                        )),
                  ),
                  InkWell(
                    onTap: () async {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => CheckOutPage()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          color: Colors.orange[800],
                          // gradient: mainButton,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0))),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(
                        child: Text(
                          'Buy Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold, fontFamily: 'Poppins'
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    // onTap: () {
                    //   scaffoldKey.currentState!.showBottomSheet((context) {
                    //     return ShopBottomSheet();
                    //   });
                    // },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          color: Colors.orange[800],
                          // gradient: myGradient,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0))),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(
                        child: Text(
                          'Add to cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,fontFamily: 'Poppins'
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}