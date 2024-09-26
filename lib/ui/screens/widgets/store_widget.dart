
import 'package:flutter/material.dart';
import 'package:discountnearme/constants.dart';
import 'package:discountnearme/ui/screens/detail_page.dart';
import 'package:page_transition/page_transition.dart';

import '../../../models/stores.dart';

class StoreWidget extends StatelessWidget {
  const StoreWidget({
    Key? key, required this.index, required this.storeList,
  }) : super(key: key);

  final int index;
  final List<Store> storeList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: DetailPage(
                  plantId: storeList[index].storeId,
                ),
                type: PageTransitionType.bottomToTop));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Constants.primaryColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 80.0,
        padding: const EdgeInsets.only(left: 0, top: 0),
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 90.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(.8),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    width: 100.0,
                    child:
                    Image.asset(storeList[index].imageURL),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 110,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        storeList[index].store,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Constants.blackC,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(storeList[index].desc,
                        style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Constants.greyColor,
                      ),),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}