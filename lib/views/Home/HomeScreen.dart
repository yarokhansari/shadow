import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shadow/Global/Loading.dart';
import 'package:shadow/controllers/homec.dart';
import 'package:shadow/views/Home/Components/Cards.dart';
import 'package:shadow/views/Home/Components/coupons.dart';
import '../../Global/AppBar.dart';
import '../../Global/SizeWala.dart';
import '../../models/homem.dart';
import 'Components/Homebanner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Homem? data;
  homec homeC = homec();

  @override
  void initState() {
    super.initState();
    homef();
  }

  homef() async {
    data = await homeC.homef();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    List pageSize = SizeWala(context);

    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Shadow'),
        appBar: AppBar(),
        widgets: <Widget>[Icon(Icons.more_vert)],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: data == null
                      ? Center(child: loadingWidget())
                      : HomeBanner(images: data!.banners!, height: pageSize[sizer.screenHeight.index] * 0.2, width: pageSize[sizer.screenWidth.index] * 0.95)),
              data != null && data!.coupons != null
                  ? CouponsScreen(offers: data!.coupons!, height: pageSize[sizer.screenHeight.index] * 0.08, width: pageSize[sizer.screenWidth.index] * 0.95)
                  : SizedBox(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: NewArrivalProducts(tlt: "New Arrival"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: NewArrivalProducts(tlt: "Featured Products"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
