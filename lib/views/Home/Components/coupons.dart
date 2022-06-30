import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shadow/models/homem.dart';

class CouponsScreen extends StatelessWidget {
  List<Coupons> offers;
  double height;
  double width;
  CouponsScreen({Key? key, required this.height, required this.width, required this.offers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: offers
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SizedBox(
                    width: width * 0.7,
                    child: CouponCard(
                        curvePosition: width * 0.15,
                        curveAxis: Axis.vertical,
                        firstChild: Container(
                          color: Colors.orange,
                          child: Center(
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.offline_pin_rounded,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        secondChild: Container(
                          color: Colors.white,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  e.description.toString(),
                                  style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "Use code " + e.code.toString(),
                                  style: GoogleFonts.lato(fontSize: 12),
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
              )
              .toList()),
    );
  }
}