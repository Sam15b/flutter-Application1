import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../Widget/themes.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key?key, required this.image}):super(key: key);
  @override
  Widget build(BuildContext context) {
    var catalog;
    return Image.network(
            image
            ).box.rounded.p8.color(context.canvasColor).make().p16().wPCT(context: context, widthPCT: context.isMobile?40:20);
        
      
  }
}