import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/widgets.dart';

Widget svg(String name) {
  return SvgPicture.asset('assets/svg/$name.svg');
}

extension SvgExtension on String {
  Widget get svg {
    return SvgPicture.asset('assets/svg/$this.svg');
  }
}

Widget png(String name) {
  return Image.asset('assets/img/$name.png');
}

extension PngExtension on String {
  Image get png {
    return Image.asset('assets/img/$this.png');
  }
}
