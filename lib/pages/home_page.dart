import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; 
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Core/store.dart';
import 'package:flutter_application_1/Widget/drawer.dart';
import 'package:flutter_application_1/Widget/themes.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/utilies/routes.dart';
import '../Widget/Home_Widget/catalog_header.dart';
import '../Widget/Home_Widget/catalog_list.dart';
import '../Widget/item_widget.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int day = 30;

  final String name = "Alipur";
  
  final url ="https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async{
    await  Future.delayed(Duration(seconds: 2));
 //final CatalogJson= await  rootBundle.loadString("assets/files/catalog.json");

 final response =await http.get(Uri.parse(url));
 final catalogJson = response.body;
 final decodedData= jsonDecode(catalogJson);
 var productsData= decodedData["products"];
 CatalogModel.items= List.from(productsData)
 .map<Item>((item)=> Item.fromMap(item))
 .toList();
 setState(() { }
 );
  }

  Widget build(BuildContext context) {
    final _Cart= (VxState.store as MyStore).cart;
    return  Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations:{AddMutation,RemoveMutation} ,
        builder:(ctx,_)=> FloatingActionButton(
          onPressed: ()=>Navigator.pushNamed(context, MyRoutes.cartRoutes),
          backgroundColor: context.theme.buttonColor,
          child: Icon(CupertinoIcons.cart,color: Colors.white,),
          ).badge(
            color: Vx.red500,
            size:22,
            count:_Cart.items.length,
            textStyle: TextStyle(
              color: Vx.red500,
              fontWeight:FontWeight. bold
            )),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            children: [
             CatalogHeader(),
             if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
             CatalogList().py16().expand()
             else
              CircularProgressIndicator().centered().expand()
             
            ]
            ),
        ),
      ),
    );
        
     
   
  }
}