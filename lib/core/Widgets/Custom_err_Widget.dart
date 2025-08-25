import 'package:bookly/core/utils/Styles.dart';
import 'package:flutter/widgets.dart';

class CustomErrWidget extends StatelessWidget {
  const CustomErrWidget({super.key, required this.errmessage});
  final String errmessage;
  @override
  Widget build(BuildContext context) {
    return Text(errmessage, style: Styles.text18);
  }
}
