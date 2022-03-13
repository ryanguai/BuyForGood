import 'constants.dart';
import 'shop_item_list.dart';
import 'product.dart';
import 'package:flutter/material.dart';

class ShopProduct extends StatelessWidget {
  final Product product;
  final VoidCallback onRemove;

  const ShopProduct(
      this.product, {
        required this.onRemove,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          children: <Widget>[
            ShopProductDisplay(
              product,
              onPressed: onRemove,
            ),
            Padding(
              padding: const EdgeInsets.only(left : 30.0),
              child: Text(
                product.name,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: darkGrey,
                ),
              ),
            ),
            Text(
              '\$${product.price}',
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ],
        ));
  }
}

class ShopProductDisplay extends StatelessWidget {
  final Product product;
  final VoidCallback onPressed;

  const ShopProductDisplay(this.product, {required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 200,
      child: Stack(children: <Widget>[
        Positioned(
          left: 25,
          child: SizedBox(
            height: 150,
            width: 150,
            child: Transform.scale(
              scale: 1.2,
              // child: Image.asset('assets/images/bottom_yellow.png'),
            ),
          ),
        ),
        Positioned(
          left: 50,
          top: 25,
          child: SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                '${product.image}',
                fit: BoxFit.contain,
              )),
        ),
        Positioned(
          right: 30,
          bottom: 25,
          child: Align(
            child: IconButton(
              icon: Image.asset('assets/images/red_clear.png'),
              onPressed: onPressed,
            ),
          ),
        )
      ]),
    );
  }
}
