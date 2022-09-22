import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widget/Home_Widget/add_to_cart.dart';
import 'package:flutter_application_1/Widget/themes.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key?key, required this.catalog})
  :assert(catalog!=null),
  super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
                    alignment:MainAxisAlignment.spaceBetween ,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      "\$${catalog.price}".text.bold.xl4.red800.make(),
                     AddToCart(
                      catalog: catalog,
                      ).wh(120,50)
                    ],
                  ).p32(),
      ),
      body: SafeArea( 
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
               child:Image.network(catalog.image)
               ).h32(context),
            Expanded(
              child: VxArc(
                height: 10.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                           color:context.cardColor ,
                           width: context.screenWidth,
                           child: Column(
                            children: [
                              catalog.name.text.xl4
                              .color(context.accentColor).bold.make(),
                catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                10.heightBox,
                "Hello braoj idihadadi ajbauehqekn aihdad adi.adadiahdli adknadkankndannkaa adkna knad jwfwf kndsndao sns".
                text.
                make().p16()
                            ],
                           ).py64(),
                ),
              ))
          ]),
      ),
    );
  }
}