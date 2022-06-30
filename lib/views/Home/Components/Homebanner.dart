import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeBanner extends StatefulWidget {
  List images;
  double width;
  double height;

  HomeBanner({required this.images, required this.height, required this.width});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  @override
  void initState() {
    super.initState();
    log('init banner');
  }

  @override
  Widget build(BuildContext context) {
    return _productImage(widget.height, widget.width);
  }

  Widget _productImage(double height, double width) {
    return SizedBox(
        height: height,
        child: CarouselSlider(
          options: CarouselOptions(
              height: height, viewportFraction: 1.0, enlargeCenterPage: false, autoPlay: true),
          items: imageSend(height, width),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  imageSend(double height, double width) {
    if (widget.images.isEmpty) {
      return [Container()];
    }

    final List<Widget> imageSliders = widget.images
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item.toString(),
                            fit: BoxFit.cover, width: 1200.0, height: 300),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
    return imageSliders;

    // final List<Widget> imageSliders = widget.images.map((item) {
    //   return Container(
    //     margin: const EdgeInsets.all(5.0),
    //     child: ClipRRect(
    //         borderRadius: const BorderRadius.all(Radius.circular(5.0)),
    //         child: Stack(
    //           children: <Widget>[
    //             CachedNetworkImage(
    //               imageUrl: item.toString(),
    //               key: Key(item),
    //               fit: BoxFit.cover,
    //               width: double.infinity,
    //               errorWidget: (context, obj, stacktrace) => Container(),
    //               cacheKey: item.toString(),
    //             ),
    //           ],
    //         )),
    //   );
    // }).toList();
    // return imageSliders;
  }
}
