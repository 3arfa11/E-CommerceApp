import 'package:ecommerceapp/screens/item_details.dart';
import 'package:ecommerceapp/screens/search_page.dart';
import 'package:ecommerceapp/screens/specific_category_page.dart';
import 'package:flutter/material.dart';

import '../const.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categoryList= [
    "Headphone",
    "Headband",
    "Earpads",
    "Cable"
  ];
  int selectedIndex=0;
  // final _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(
          Icons.menu_rounded,
          size: 25,
        ),
        centerTitle: true,
        title: Row(
          children: [
            const SizedBox(
              width: 80,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.asset("assets/images/logo.jpg")),
            ),
            const SizedBox(
              width: 3,
            ),
            const Text(
              "Audio",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            )
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/person.jpg"),
            ),
          )
        ],
      ),
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Hi, Sami",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "What are you looking for\n today?",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                       TextFormField(
                          decoration: InputDecoration(
                            prefixIcon:  InkWell(
                              onTap: (){
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context)=>const SearchPage())
                                );
                              },
                              child: const Icon(
                                Icons.search_sharp,
                                color: Colors.grey,
                              ),
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

                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 600,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.grey.shade200),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 19),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 30,
                          child: ListView.separated(
                            itemBuilder: (context,index){
                              return InkWell(
                                onTap: (){
                                  setState(() {
                                    selectedIndex=index;
                                  });
                                },
                                child: Container(
                                  width: 85,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: selectedIndex==index? const Color(mainColor):Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(40)
                                  ),
                                  child:  Center(child: Text(categoryList[index],style:  TextStyle(
                                      color: selectedIndex==index?Colors.white:Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      decoration: TextDecoration.none
                                  ),),),
                                ),
                              );
                            },
                            itemCount: categoryList.length,
                            separatorBuilder: (context,index)=>SizedBox(width: 30,),
                            scrollDirection: Axis.horizontal,

                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        SizedBox(
                            height: 206,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                adItemBuilder(),
                                const SizedBox(
                                  width: 15,
                                ),
                                adItemBuilder(),
                                const SizedBox(
                                  width: 15,
                                ),
                                adItemBuilder(),
                              ],
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Featured Products",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right:15),
                              child: InkWell(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context)=>const ItemsPage())
                                  );
                                },
                                child: Text("See All",style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black.withOpacity(.6)
                                ),),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height:15 ,),
                        SizedBox(
                          height: 226,
                          child:ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              bottomItemBuilder(),
                              const SizedBox(width: 16,),
                              bottomItemBuilder(),
                              const SizedBox(width: 16,),
                              bottomItemBuilder(),
                              const SizedBox(width: 16,),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomItemBuilder() {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=> const ItemDetails())
        );
      },
      child: Container(
                          width: 170,
                          height: 225,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 15,),
                              Image.asset("assets/images/headphone.png"),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20,),
                                  Text("TMA-2 HD Wireless",style: TextStyle(fontSize: 15),),
                                  SizedBox(height:1 ,),
                                  Text("350 USD",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16
                                  ),),
                                ],
                              )
                            ],
                          ),
                        ),
    );
  }

  Widget adItemBuilder() {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=> const ItemDetails())
        );
      },
      child: Container(
        width: 375,
        height: 205,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "TMA-2 \n Modular \n Headphone",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Text(
                        "Shop now ",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0ACF83),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward_outlined,
                        color: Color(0xFF0ACF83),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 35,
            ),
            Image.asset(
              "assets/images/headphone.png",
              width: 170,
              height: 190,
            )
          ],
        ),
      ),
    );
  }
}
