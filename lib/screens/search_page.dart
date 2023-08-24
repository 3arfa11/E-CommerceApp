import 'package:ecommerceapp/screens/item_details.dart';
import 'package:ecommerceapp/screens/shopping_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const.dart';
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _search = TextEditingController();
  List<String> list = ["sami"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
            child: const Icon(Icons.arrow_back_ios,color: Colors.black,size: 19,)),
        centerTitle: true,
        title: const Text("Search",style: TextStyle(
          color: Colors.black,
          fontSize: 19,
          fontWeight: FontWeight.bold
        ),),
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
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                SizedBox(height: 55,
                  child: TextFormField(
                    controller: _search,

                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search_sharp,
                        color: Colors.grey,
                      ),
                      hintText: "Search headphone",
                      hintStyle: const TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25,),
                const Text("Latest search"),
                const SizedBox(height: 30,),
                Row(
                  children: [
                    const Icon(Icons.access_time_rounded,color: Colors.grey,),
                    const SizedBox(width:8 ,),
                    Text("TMA2-2 Wireless",style: TextStyle(
                        color: Colors.black.withOpacity(.8)
                    ),),
                    const Spacer(),
                    Icon(CupertinoIcons.xmark,size: 21,color: Colors.black.withOpacity(.6))
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                  children: [
                    const Icon(Icons.access_time_rounded,color: Colors.grey,),
                    const SizedBox(width:8 ,),
                    Text("Cable",style: TextStyle(
                        color: Colors.black.withOpacity(.8)
                    ),),
                    const Spacer(),
                    Icon(CupertinoIcons.xmark,size: 21,color: Colors.black.withOpacity(.6),)
                  ],
                ),
                const SizedBox(height: 25,),
                const Text("Popular Products"),
                const SizedBox(height: 25,),
                searchItemBuilder(name: "TMA-2 Comfort Wireless",
                    price: "270 USD",
                    image: headphone,
                    rate: "4.7",
                   review: "86 Reviews"
                ),
                const SizedBox(height: 30,),
                searchItemBuilder(name: "TMA-2 Comfort Wireless",
                    price: "270 USD",
                    image: headphone,
                    rate: "4.7",
                   review: "86 Reviews"
                ),
                const SizedBox(height: 30,),
                searchItemBuilder(name: "TMA-2 Comfort Wireless",
                    price: "270 USD",
                    image: headphone,
                    rate: "4.7",
                   review: "86 Reviews"
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget searchItemBuilder({
    required String name ,
    required String price,
    required String image,
    required String rate,
    required String review,
}) {
    return SizedBox(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=> const ItemDetails())
                      );
                    },
                    child: Container(
                        width: 85,
                        height: 85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade200
                        ),
                        child: Image.asset(image,width: 70,)),
                  ),
                  const SizedBox(width: 20,),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5,),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=> const ItemDetails())
                          );
                        },
                        child: Text(name,style: const TextStyle(
                          color: Colors.black,
                          // fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),),
                      ),
                      const SizedBox(height: 5,),
                      Text(price,style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold

                      ),),
                      const SizedBox(height: 4,),
                      Row(
                        children: [
                          const Icon(Icons.star_outlined,color: Colors.orange,size: 20,),
                          const SizedBox(width: 3,),
                          Text(rate),
                          const SizedBox(width: 15,),
                          Text(review),
                          const SizedBox(width: 120,),
                          Icon(Icons.more_vert,color: Colors.black.withOpacity(.6),)
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
  }
}
