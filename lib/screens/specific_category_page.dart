import 'package:ecommerceapp/const.dart';
import 'package:ecommerceapp/screens/filter_page.dart';
import 'package:ecommerceapp/screens/item_details.dart';
import 'package:ecommerceapp/screens/shopping_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
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
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.only(left:10),
              child: Text("Headphone",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),),
            ),
            const SizedBox(height: 10,),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("TMA Wireless",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>const FilterPage())
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1,color: Colors.grey)
                  ),
                  width: 100,
                  height: 35,
                  child: const Row(
                    children: [
                      SizedBox(width: 8,),
                      Icon(CupertinoIcons.slider_horizontal_3),
                      SizedBox(width: 10,),
                      Text("Filter",style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 35,),
            Container(
              width: double.infinity,
              height: 590,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.shade200
              ),
              child: GridView.builder(
                itemCount: 8,
                 itemBuilder: (BuildContext context , int index){
                   return InkWell(
                     onTap: (){
                       Navigator.of(context).push(
                         MaterialPageRoute(builder: (context)=>ItemDetails())
                       );
                     },
                     child: Container(
                       margin: const EdgeInsets.only(top: 10),
                       width: 80,
                       height: 150,
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(20)
                       ),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           const SizedBox(height: 10,),
                           Padding(
                             padding: const EdgeInsets.only(left:55),
                             child: Image.asset(headphone,width: 100  ,),
                           ),
                           const SizedBox(height: 40  ,),
                           const Padding(
                             padding: EdgeInsets.only(left: 10),
                             child: Text("TMA-2 HD Wireless",style: TextStyle(
                               color: Colors.black,
                               fontWeight: FontWeight.bold
                             ),),
                           ),
                           const SizedBox(height: 5,),
                           const Padding(
                             padding: EdgeInsets.only(left: 10.0),
                             child: Text("350 USD",style: TextStyle(
                                 fontWeight: FontWeight.bold
                             ),),
                           ),
                           const SizedBox(height: 20,),
                           Padding(
                             padding: const EdgeInsets.only(left:7),
                             child: Row(
                               children: [
                                 const Icon(Icons.star_outlined,color: Color(0xFFFFC120),size: 20,),
                                 const SizedBox(width: 3,),
                                 const Text("4.6"),
                                 const SizedBox(width: 15,),
                                 const Text("86 Reviews"),
                                 const SizedBox(width: 20,),
                                 Icon(Icons.more_vert,color: Colors.black.withOpacity(.6),)
                               ],
                             ),
                           )
                         ],
                       ),
                     ),
                   );

                 },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 280,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
