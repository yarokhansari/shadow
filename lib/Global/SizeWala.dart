import 'package:flutter/cupertino.dart';

enum sizer { 
   sheight, 
   swidth, 
   screenHeight, 
   screenWidth 
}

SizeWala(BuildContext context){
  double sheight = MediaQuery.of(context).size.height;
  double swidth = MediaQuery.of(context).size.width;
  double screenHeight = sheight; //temp
  double screenWidth = swidth; //temp
  if (MediaQuery.of(context).orientation == Orientation.portrait) {
    screenHeight = sheight;
    screenWidth = swidth;
  } else {
    screenHeight = swidth;
    screenWidth = sheight;
  }
  return [
    sheight,
    swidth,
    screenHeight,
    screenWidth
  ]; 
}