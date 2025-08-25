import 'package:bookly/core/utils/Styles.dart';
import 'package:flutter/material.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({super.key, this.mainaxisaligment = MainAxisAlignment.start});
  final MainAxisAlignment mainaxisaligment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainaxisaligment,
      children: [
        Icon(Icons.star, color: Colors.amber),
        const SizedBox(width: 3),
        Text("0.0"),
        const SizedBox(width: 3),
        Text("(0)", style: Styles.text14.copyWith(color: Colors.grey)),
      ],
    );
  }
}
