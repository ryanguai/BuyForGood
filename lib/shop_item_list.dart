import 'app_properties.dart';
import 'product.dart';
import 'color_list.dart';
import 'shop_product.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class ShopItemList extends StatefulWidget {
  final Product product;
  final VoidCallback onRemove;

  ShopItemList(this.product, {required this.onRemove});

  @override
  _ShopItemListState createState() => _ShopItemListState();
}

class _ShopItemListState extends State<ShopItemList> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 130,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(0, 0.8),
            child: Container(
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: shadow,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 20.0, left: 90.0),
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.product.name,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: darkGrey,
                                  fontFamily: 'Poppins',
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 160,
                                padding: const EdgeInsets.only(
                                    left: 37.0, top: 11.0, bottom: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    // ColorOption(Colors.red),
                                    Text(
                                      '\$${widget.product.price}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: darkGrey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                          fontFamily: 'Poppins'),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Theme(
                          data: ThemeData(
                              accentColor: Colors.black,
                              textTheme: TextTheme(
                                headline6: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                bodyText1: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  color: Colors.grey[400],
                                ),
                              )),
                          child: NumberPicker(
                            value: quantity,
                            minValue: 1,
                            maxValue: 10,
                            onChanged: (value) {
                              setState(() {
                                quantity = value;
                              });
                            },
                          ))
                    ])),
          ),
          Positioned(
              top: 5,
              child: ShopProductDisplay(
                widget.product,
                onPressed: widget.onRemove,
              )),
        ],
      ),
    );
  }
}