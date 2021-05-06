import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Utils {
  static Widget buildJuejinSvg(Color color) {
    return Center(
      child: SvgPicture.asset(
        'assets/images/juejin.svg',
        color: color,
      ),
    );
  }
}
