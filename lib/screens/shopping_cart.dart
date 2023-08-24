import 'package:ecommerceapp/const.dart';
import 'package:flutter/material.dart';
class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  List<String> productName = [
    "TMA-2 Comfort Wireless",
    "CO2-Cable",
    "TMA-2 Comfort Wireless",
    "CO2-Cable",
    "TMA-2 Comfort Wireless",
    "CO2-Cable",

  ];
  List<int> quantities = [1,1,1,1,1,1];
  List<double> priceList = [125,250,100,200,300,120];
  void incrementQuantity(int index) {
    setState(() {
      quantities[index]++;
    });
  }
  void decrementQuantity(int index) {
    setState(() {
      quantities[index]--;
    });
  }
  double getCartTotal(){
    double total = 0.0 ;
    for(int i= 0;i<productName.length;i++){
      total += quantities[i]*priceList[i];
    }
    return total;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios,size: 17,)),
        centerTitle: true,
        title: const Text("Shopping Cart"),
        actions: [
          InkWell(
          onTap: (){
            setState(() {
              productName.clear();
            });
          },
            child: const Icon(Icons.delete)),const SizedBox(width: 8,)],
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(45)
                ),
                width: double.infinity,
                height: 550,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.separated(
                       itemCount: productName.length,
                      separatorBuilder:(context,index)=> const SizedBox(height: 25,),
                      itemBuilder:(context,index) {
                        return Dismissible(
                          key: Key(productName[index]),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction){
                            setState(() {
                              productName.removeAt(index);
                            });
                          },
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 10),
                            child:  Icon(Icons.delete,color: Colors.red.withOpacity(.5),),
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: 85,
                                    height: 85,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.grey.shade200
                                    ),
                                    child: Image.asset(headphone,width: 70,)),
                                const SizedBox(width: 20,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 0,),
                                    Text(productName[index],style: const TextStyle(
                                        color: Colors.black,
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18
                                    ),),
                                    const SizedBox(height: 5,),
                                    Text("${priceList[index]} USD",style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold

                                    ),),
                                    const SizedBox(height: 3,),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            if(quantities[index]==0){
                                              quantities[index]=0;
                                            }
                                            else {
                                              decrementQuantity(index);
                                            }
                                            },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(color: Colors.grey),
                                            ),
                                            width: 28,
                                            height: 28,
                                            child: const Icon(Icons.horizontal_rule,),
                                          ),
                                        ),
                                        const SizedBox(width: 20,),
                                        Text(quantities[index].toString(),style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                        ),),
                                        const SizedBox(width: 20,),
                                        InkWell(
                                          onTap: (){

                                            incrementQuantity(index);

                                            },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(color: Colors.grey),
                                            ),
                                            width: 28,
                                            height: 28,
                                            child: const Icon(Icons.add),
                                          ),
                                        ),
                                        const SizedBox(width: 115,),
                                        InkWell(
                                            onTap: (){
                                              setState(() {
                                                productName.removeAt(index);
                                              });
                                            },
                                            child: Icon(Icons.delete,color: Colors.red.withOpacity(.7),))
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        const SizedBox(height:135 ,),
                        Text("Total Price : ",style: TextStyle(
                          fontSize: 20,
                          color: Colors.black.withOpacity(.6),
                          fontWeight: FontWeight.bold
                        ),),
                        const SizedBox(width: 15,),
                        Text(getCartTotal().toStringAsFixed(2),style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),)
                      ],
                    ),
                  ),
                  Container(
                    width: 340,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0ACF83),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        SizedBox(width: 33,),
                        Text("Proceed to Checkout",style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                        ),),
                        SizedBox(width: 99,),
                        Icon(Icons.arrow_forward_ios,size: 20,color: Colors.white,)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
      ),

    );
  }
}
