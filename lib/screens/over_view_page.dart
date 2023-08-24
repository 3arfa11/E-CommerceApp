import 'package:ecommerceapp/const.dart';
import 'package:ecommerceapp/screens/specific_category_page.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
class OverViewPage extends StatefulWidget {
  const OverViewPage({super.key});

  @override
  State<OverViewPage> createState() => _OverViewPageState();
}

class _OverViewPageState extends State<OverViewPage> {
  List images = [
    headphone,
    cable,
    cable

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20,),
                    SizedBox(
                      width: double.infinity,
                      height: 380,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey.shade200
                            ),
                              child: Image.asset(headphone2)),
                          const SizedBox(width: 10,),
                          Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.8),
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Image.asset(headphoneDetails)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 35,),
                    const Text("Reviews(102)",style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),),
                    const SizedBox(height: 20,),
                    SizedBox(
                      height: 330,
                      child: ListView.separated(
                          itemBuilder: (context,index){
                            return const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(person),
                                    ),
                                    SizedBox(width: 10,),
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Madelina",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),),
                                        SizedBox(height: 1,),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.star_outlined,size: 18,color: Color(0xFFFFC120),),
                                                Icon(Icons.star_outlined,size: 18,color: Color(0xFFFFC120),),
                                                Icon(Icons.star_outlined,size: 18,color: Color(0xFFFFC120),),
                                                Icon(Icons.star_outlined,size: 18,color: Color(0xFFFFC120),),
                                                Icon(Icons.star_outlined,size: 18,color: Color(0xFFFFC120),),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Text("1 Month ago",style: TextStyle(
                                        color: Colors.grey
                                    ),)
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Padding(
                                  padding: EdgeInsets.only(left:48),
                                  child: Text("Lorem ipsum dolor sit amet, consectetur\n"
                                      " adipiscing elit, sed do eiusmod tempor\n"
                                      " incididunt ut labore et dolore magna\n aliqua.",style: TextStyle(
                                    fontSize: 17,
                                  ),),
                                )
                              ],
                            );

                          },
                          separatorBuilder: (context,index)=>const SizedBox(height: 20,),
                          itemCount: 3),
                    ),
                    const SizedBox(height: 30,),
                    const Center(child:Text("See All Reviews",style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16
                    ),),),
                    const SizedBox(height: 50,),
                    
                  ],
                ),
              ),
            ),
            Container(
              width:double.infinity ,
              height: 320,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text("Another Product",style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17
                        ),),
                        const Spacer(),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=>const ItemsPage())
                            );
                          },
                          child: Text("See All",style: TextStyle(
                            color: Colors.black.withOpacity(.6),
                          ),),
                        ),
                        const SizedBox(height: 20,),

                      ],
                    ),
                    const SizedBox(height: 30,),
                    SizedBox(
                      height: 226,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index){
                            return Container(
                              width: 170,
                              height: 225,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(17),
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 15,),
                                  Image.asset(images[index]),
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
                            );
                          },
                          separatorBuilder:(context,index)=>const SizedBox(width: 16,),
                          itemCount: 3),
                    ),

                  ],
                ),
              ),
            ),
            const SizedBox(height: 30,),
            Center(
              child: InkWell(
                onTap: (){
                  showTopSnackBar(
                    Overlay.of(context),
                    const CustomSnackBar.success(
                      message:
                      "Item Added To Cart Successfully",
                      backgroundColor: Color(mainColor),
                    ),
                  );
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //       content: Text("Item Added Successfully To Cart"),
                  //
                  //   )
                  // );

                },
                child: Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(mainColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child:Text("Add To Cart",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        decoration: TextDecoration.none
                    ),),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60,),
          ],
        ),
      ),
    );
  }
}
