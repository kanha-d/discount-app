import 'package:flutter/foundation.dart';

class Coupons {
  final int couponId;
  final String coupon;
  final String desc;
  final String timelapse;
  final String imageURL;

   Coupons( {required this.couponId,
        required this.coupon,
        required this.desc,
        required this.timelapse,
        required this.imageURL});

//List of Plants data
  static List<Coupons> couponsList = [
    Coupons(
      couponId: 1,
      coupon: '#WhoWhatWear',
      desc: 'Clothing and accessories',
      timelapse: 'Use until 13th of May',
      imageURL: 'assets/images/zara.png',
    ),
    Coupons(
      couponId: 2,
      coupon: 'Max',
      desc: 'Fashion apparel',
      timelapse: 'Use until 31th of Dec',
      imageURL: 'assets/images/max.png',
    ),
    Coupons(
      couponId: 3,
      coupon: 'H & M',
      desc: 'Coffee shop',
      timelapse: 'Use until 01th of Aug',
      imageURL: 'assets/images/hnm.png',
    ),
    Coupons(
      couponId: 4,
      coupon: 'Puma',
      desc: 'Supermarket chain',
      timelapse: 'Use until 11th of June',
      imageURL: 'assets/images/puma.png',
    ),
  ];


}
