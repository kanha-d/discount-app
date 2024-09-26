import 'package:flutter/foundation.dart';

class Cats {
  final int catId;
  final String catName;
  final String imageURL;

  Cats(
      {required this.catId,
        required this.catName,
        required this.imageURL});

//List of Plants data
  static List<Cats> catsList = [
    Cats(
        catId: 0,
        catName: 'Food',
        imageURL: 'assets/images/restaurant.png'
        ),
    Cats(
        catId: 1,
        catName: 'Fashion',
        imageURL: 'assets/images/dress.png'
    ),
    Cats(
        catId: 2,
        catName: 'Footwear',
        imageURL: 'assets/images/sneakers.png'
    ),
    Cats(
        catId: 3,
        catName: 'Accessories',
        imageURL: 'assets/images/bags.png'
    ),
    Cats(
        catId: 4,
        catName: 'Cosmetics',
        imageURL: 'assets/images/cosmetics.png'
    ),
    Cats(
        catId: 5,
        catName: 'Travel',
        imageURL: 'assets/images/travel.png'
    )
  ];
}
