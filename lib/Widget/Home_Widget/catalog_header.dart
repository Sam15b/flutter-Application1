import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../Widget/themes.dart';


class CatalogHeader extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
     return Column(
            children: [
              "Sam App".text.xl5.bold.color(context.theme.accentColor).make(),
              "Trending Products".text.xl2.make()
            ]
            );
  }
}