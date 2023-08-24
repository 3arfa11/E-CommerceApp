import 'package:ecommerceapp/const.dart';
import 'package:ecommerceapp/screens/over_view_page.dart';
import 'package:ecommerceapp/screens/shopping_cart.dart';
import 'package:flutter/material.dart';

import 'fetures_page.dart';
class ItemDetails extends StatefulWidget {
  const ItemDetails({super.key});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int selectedIndex=0;
  List<String> list =[
    "Overview",
    "Features",
    "Specification"
  ];
  List<Widget> pagesList =[
    const OverViewPage(),
    const FeaturesPage(),
    const OverViewPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios,color: Colors.black,size: 19,)),

        actions:  [Padding(
          padding: const EdgeInsets.only(right:15),
          child: InkWell(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>const ShoppingCartPage())
                );
              },
              child: const Icon(Icons.shopping_cart_outlined,color: Colors.black,size: 25,)),
        )],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15,top: 15,right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("TMA-2",style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),),
              const Text("HD Wireless",style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),),
              const Text("300 USD",style: TextStyle(
                color: Color(mainColor),
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
              const SizedBox(height: 10,),
              SizedBox(
                height: 25,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index) {
                      return InkWell(
                        onTap: (){
                          setState(() {
                            selectedIndex=index;
                          });
                        },
                        child: Container(
                          height: 32,
                          decoration:selectedIndex==index? const BoxDecoration(
                              border:Border(
                                  bottom:BorderSide(
                                    width: 2,
                                    color: Color(mainColor),
                                    style: BorderStyle.solid
                                  )
                              )
                          ):const BoxDecoration(
                          ),
                          child: Text(list[index],style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),),
                        ),
                      );
                    },
                    separatorBuilder: (context,index)=>const SizedBox(width: 40,),
                    itemCount: list.length),
              ),
              const SizedBox(height: 40,),
              Container(
                width: double.infinity,
                height: 650,
                decoration: const BoxDecoration(
                  color: Colors.grey
                ),
                child:pagesList[selectedIndex],
              )
            ],
          ),
        ),
      ),
    );
  }
}
