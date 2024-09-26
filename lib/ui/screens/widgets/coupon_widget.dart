
import 'package:discountnearme/models/coupons.dart';
import 'package:flutter/material.dart';
import 'package:discountnearme/constants.dart';
import 'package:discountnearme/ui/screens/detail_page.dart';
import 'package:page_transition/page_transition.dart';


class CouponWidget extends StatelessWidget {
  const CouponWidget({
    Key? key, required this.index, required this.couponList,
  }) : super(key: key);

  final int index;
  final List<Coupons> couponList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: DetailPage(
                  plantId: couponList[index].couponId,
                ),
                type: PageTransitionType.bottomToTop));
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Constants.whiteColor,
          borderRadius: BorderRadius.circular(13), // Larger border radius
          border: Border.all(color: Constants.blackColor.withOpacity(.2)), // Adding border
        ),
        height: 100.0,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: Constants.whiteColor.withOpacity(.8),
                    borderRadius: BorderRadius.circular(15), // Adding border radius
                  ),
                ),
                Positioned(
                  child: Center(
                    child: SizedBox(
                      width: 130.0, // Adjust size to center
                      child: Image.asset(couponList[index].imageURL), // Center the image
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        couponList[index].coupon,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Constants.blackColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                          couponList[index].timelapse,
                          style: TextStyle(
                            color: Constants.blackColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}