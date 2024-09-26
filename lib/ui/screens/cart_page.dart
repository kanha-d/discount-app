import 'package:discountnearme/models/coupons.dart';
import 'package:discountnearme/ui/screens/widgets/coupon_widget.dart';
import 'package:flutter/material.dart';
import 'package:discountnearme/constants.dart';


class CartPage extends StatefulWidget {
  final List<Coupons> couponsList;
  const CartPage({Key? key, required this.couponsList}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.couponsList.isEmpty
          ? Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Image.asset('assets/images/favorited.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Your favorited Plants',
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
            ),
          ],
        ),
      )
          : Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
        child:GridView.builder(
          itemCount: widget.couponsList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of items in a row
            crossAxisSpacing: 10, // Horizontal space between items
            mainAxisSpacing: 10, // Vertical space between items
            childAspectRatio: 0.75, // Aspect ratio for each grid item
          ),
          physics: const BouncingScrollPhysics(), // Scroll behavior
          itemBuilder: (BuildContext context, int index) {
            return CouponWidget(
              index: index,
              couponList: widget.couponsList,
            );
          },
        )
      ),
    );
    }
}
