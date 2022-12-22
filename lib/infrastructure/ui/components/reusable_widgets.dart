import 'package:flutter/material.dart';

import 'package:web_rtc_app/infrastructure/core/constants/image_constants.dart';
import 'image_view_component.dart';

Widget renderLogoImageView(BuildContext context, {bool fullLogo = false, String imagePath = ''}) => Container(
    margin: EdgeInsets.only(left: 20, top: (fullLogo ? 0 : 10), right: 20, bottom: (fullLogo ? 0 : 10)),
    height: MediaQuery.of(context).size.width *  (fullLogo ? 0.3 : 0.3),
    width: double.infinity,
    child: ImageViewComponent(fullLogo ? ImagesConstant.logo.image : imagePath));


Widget renderImageView(BuildContext context, String path) => Container(
    margin:const  EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
    height: MediaQuery.of(context).size.height *  0.6,
    width: double.infinity,
    child: ImageViewComponent(path));


Widget heightSeparator(BuildContext context, double heightPercentage) => SizedBox(
      height: MediaQuery.of(context).size.height * heightPercentage,
    );
  