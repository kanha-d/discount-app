import 'package:flutter/foundation.dart';

class Store {
  final int storeId;
  final String store;
  final String desc;
  final String imageURL;

  Store( {required this.storeId,
        required this.store,
        required this.desc,
        required this.imageURL});

//List of Plants data
  static List<Store> storesList = [
    Store(
      storeId: 1,
      store: 'Omex Mall',
      desc: '1.2 miles / 15 min walk',
      imageURL: 'assets/images/zara.png',
    ),
    Store(
      storeId: 2,
      store: 'Galleria Max',
      desc: '1.2 miles / 15 min walk',
      imageURL: 'assets/images/max.png',
    ),
    Store(
      storeId: 3,
      store: 'Exaplande Mall',
      desc: '1.2 miles / 15 min walk',
      imageURL: 'assets/images/hnm.png',
    ),
    Store(
      storeId: 4,
      store: 'Lu Lu Mall',
      desc: '1.2 miles / 15 min walk',
      imageURL: 'assets/images/puma.png',
    ),
  ];

  static List<Store> getFavStores(){
    List<Store> _travelList = Store.storesList;
    return _travelList.where((element) => element.storeId % 2 == 0).toList();
  }


}
