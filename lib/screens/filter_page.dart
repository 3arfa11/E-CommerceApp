import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const.dart';
class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<String> categoryList = [
    "Headphones",
    "Cameras",
    "Monitors"
  ];
  List<String> sortByList = [
    "Popularity",
    "Newest",
    "Oldest",
    "Most expensive",
    "cheapest",
    "may you like"
  ];
  int selectedIndex=0;
  int selectedIndex2=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.grey,
      body:Center(
          child: Container(
            width: 340,
            height: 450,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      children: [
                        const Text("Filter",style: TextStyle(
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 17
                        ),),
                        const Spacer(),
                        InkWell(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: const Icon(CupertinoIcons.xmark,size: 20,))

                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Text("Category",style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),),
                  const SizedBox(height: 20,),
                  SizedBox(height: 25,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder:(context,index)=> const SizedBox(width: 15 ,),
                      itemCount: 3,
                      itemBuilder: (context,index) {
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
                                  color: selectedIndex==index?const Color(mainColor):Colors.white,
                                  borderRadius: BorderRadius.circular(40)
                              ),
                              child:  Center(child: Text(categoryList[index],style:  TextStyle(
                                  color: selectedIndex==index?Colors.white:Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  decoration: TextDecoration.none
                              ),),),
                            ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 30,),
                  const Text("Sort By",style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    decoration: TextDecoration.none,
                  ),),
                  SizedBox(height: 90,
                    child: GridView.builder(
                      itemCount: sortByList.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 28,
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 3
                        ), itemBuilder: (BuildContext context , int index){
                          return InkWell(
                            onTap: (){
                              setState(() {
                                selectedIndex2=index;
                              });
                            },
                            child: Container(
                              width: 85,
                              height: 30,
                              decoration: BoxDecoration(
                                border:selectedIndex2==index?null:Border.all(width: 1,color: Colors.grey),
                                  color:selectedIndex2==index?const Color(mainColor):Colors.white,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child:  Center(child: Text(sortByList[index],style: TextStyle(
                                  color:selectedIndex2==index?Colors.white:Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                              ),),),
                            ),
                          );

                    }),
                  )
                  ,
                  // Column(
                  //   children: [
                  //     Row(
                  //       children: [
                  //         Container(
                  //           width: 85,
                  //           height: 30,
                  //           decoration: BoxDecoration(
                  //               color: const Color(mainColor),
                  //               borderRadius: BorderRadius.circular(10)
                  //           ),
                  //           child: const Center(child: Text("Popularity",style: TextStyle(
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 11,
                  //               decoration: TextDecoration.none
                  //           ),),),
                  //         ),
                  //         const SizedBox(width: 10,),
                  //         Container(
                  //           width: 85,
                  //           height: 30,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(10),
                  //             border:Border.all(width: 1,color: Colors.grey),
                  //           ),
                  //           child: const Center(child: Text("Popularity",style: TextStyle(
                  //               color: Colors.grey,
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 11,
                  //               decoration: TextDecoration.none
                  //           ),),),
                  //         ),
                  //         const SizedBox(width: 10,),
                  //         Container(
                  //           width: 85,
                  //           height: 30,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(10),
                  //             border:Border.all(width: 1,color: Colors.grey),
                  //           ),
                  //           child: const Center(child: Text("Popularity",style: TextStyle(
                  //               color: Colors.grey,
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 11,
                  //               decoration: TextDecoration.none
                  //           ),),),
                  //         ),
                  //         const SizedBox(width: 10,),
                  //       ],
                  //     ),
                  //     const SizedBox(height: 10,),
                  //     Row(
                  //       children: [
                  //         Container(
                  //           width: 85,
                  //           height: 30,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(10),
                  //             border:Border.all(width: 1,color: Colors.grey),
                  //           ),
                  //           child: const Center(child: Text("Popularity",style: TextStyle(
                  //               color: Colors.grey,
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 11,
                  //               decoration: TextDecoration.none
                  //           ),),),
                  //         ),
                  //         const SizedBox(width: 10,),
                  //         Container(
                  //           width: 85,
                  //           height: 30,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(10),
                  //             border:Border.all(width: 1,color: Colors.grey),
                  //           ),
                  //           child: const Center(child: Text("Popularity",style: TextStyle(
                  //               color: Colors.grey,
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 11,
                  //               decoration: TextDecoration.none
                  //           ),),),
                  //         ),
                  //         const SizedBox(width: 10,),
                  //         Container(
                  //           width: 85,
                  //           height: 30,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(10),
                  //             border:Border.all(width: 1,color: Colors.grey),
                  //           ),
                  //           child: const Center(child: Text("Popularity",style: TextStyle(
                  //               color: Colors.grey,
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 11,
                  //               decoration: TextDecoration.none
                  //           ),),),
                  //         ),
                  //         const SizedBox(width: 10,),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 15,),
                  const Text("Price Range",style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(
                          width: 130,
                          height: 40,
                          child: TextFormField(
                            decoration: InputDecoration(
                              label: const Text("Min Price",style: TextStyle(
                                color: Colors.grey
                              ),),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 1
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15,),
                        SizedBox(
                          width: 130,
                          height: 40,
                          child: TextFormField(
                            decoration: InputDecoration(
                              label: const Text("Max Price",style: TextStyle(
                                color: Colors.grey
                              ),),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 1
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 30,),

                  Padding(
                    padding: const EdgeInsets.only(left:8),
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 280,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(mainColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child:Text("Apply Filter",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              decoration: TextDecoration.none
                          ),),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
